class OptionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  def index
    @options = Option.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      redirect_to options_path
    else
      render :new 
    end
  end

  def update
    if @option.update(option_params)
      redirect_to @option
    else
      render :edit 
    end
  end

  def destroy
    @option.destroy
    redirect_to options_url
  end

  private
    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:number, :description, :name, :amount, :event_id)
    end
end
