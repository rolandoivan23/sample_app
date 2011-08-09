class SessionsController < ApplicationController
  def new
    @titulo = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid convination of email/password"
      @titulo = "Sign in"
      render :new
    else
      sign_in user
      redirect_back_or(user)
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
