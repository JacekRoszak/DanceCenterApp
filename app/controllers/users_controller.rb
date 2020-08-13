class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Payment.all.each do |p|
        if p.email == @user.email
          p.update(user_id: @user.id)
        end
      end
      redirect_to @user
    else
      render :new 
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit 
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :description, :admin, :zin, :user_name, :can_host, :picture, :post_color)
    end
end
