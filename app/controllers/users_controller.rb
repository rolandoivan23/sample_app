class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @titulo = "Sign up"
  end

end
