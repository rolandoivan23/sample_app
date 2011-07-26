class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @titulo = @user.name
  end

  def new
    @titulo = "Sign up"
  end

end
