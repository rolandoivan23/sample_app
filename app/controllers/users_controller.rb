class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @titulo = @user.name
  end

  def new
    @user = User.new
    @titulo = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the sample App"
      redirect_to @user
    else
      @titulo = "Sign up"
      render :new
    end
  end
end
