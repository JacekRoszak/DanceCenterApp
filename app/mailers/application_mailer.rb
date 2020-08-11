class ApplicationMailer < ActionMailer::Base
  default from: 'info@dancecenter.com'
  layout 'mailer'

  def test_mail
    @user = params[:user]
    @event = params[:event]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # funkcja do wysyłania maila -> ApplicationMailer.with(user: User.last, event: Event.last).test_mail.deliver_now
end
