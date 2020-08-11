class ContractsController < ApplicationController
  load_and_authorize_resource
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract, notice: 'Dodano instruktora do imprezy.' 
    else
      render :new 
    end
  end

  def update
    if @contract.update(contract_params)
      redirect_to @contract
    else
      frender :edit 
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_url, notice: 'Usunięto przypisanie.' 
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:user_id, :event_id)
    end
end
