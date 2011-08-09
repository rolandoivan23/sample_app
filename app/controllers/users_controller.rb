class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]

  def index
    @titulo = "All Users"
    @users = User.paginate :page => params[:page]
  end

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

  def update
  
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      redirect_to user_path(@user) # = que redirect_to @user
    else
      @titulo = "Edit User"
      render 'edit'
    end
  end

  def edit
   
    @titulo = "Edit user"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Destroyed"
    redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
