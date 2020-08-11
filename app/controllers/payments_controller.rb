class PaymentsController < ApplicationController
  load_and_authorize_resource

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    load_event_and_option #ładujemy @event i @option z parametru
  end

  def edit
    load_event_and_option
  end

  def create
    @payment = Payment.new(payment_params)

    # Płatnik
    user = User.find_by(email: payment_params[:email]) # jeżeli podanego e-mail nie ma w bazie
    unless user                                        # znaczy, że nie ma użytkownika w bazie
      temp_pass = SecureRandom.alphanumeric(10)        # więc bierzemy randomowe hasło
      user = User.new(                                 # i go tworzymy
        email: payment_params[:email], password: temp_pass, password_confirmation: temp_pass
      )                                                # tworzymy nowego użytkownika tylko z podanego e-mail oraz wygenerowanego hasła
      user.skip_confirmation!                          # użytkownik nie dostaje powiadomienia o założeniu konta
      user.save!
    end
    @payment.user_id = user.id

    if @payment.save
      redirect_to payments_path, notice: 'Udło się wprowadzić wpłatę.'
    else                                          
      load_event_and_option   # jeżeli nie uda się zapisać wpłaty, ładujemy @event i @option z parametru i renderujemy view new
      render :new
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: 'Udało się poprawić wpłatę.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_url, notice: 'Udało się usunąć wpłatę.'
  end

  def refund
  end

  private

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:amount, :user_id, :email, :option_id)
  end

  def load_event_and_option         # przekazujemy poprzez parametr wybór eventu i opcji
    @event = Event.find_by(id: params[:event_id])
    @option = Option.find_by(id: params[:option_id])
  end
end
