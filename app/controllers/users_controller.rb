class UsersController < ApplicationController

  # def new
  #   @user = User.new
  # end

  # def show
  #   require_user
  #   @user = User.find_by_id(params[:id])
  #   redirect_to '/' if !@user
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     flash[:notice] = "User created"
  #     redirect_to '/'
  #   else
  #     render 'new'
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:username, :email, :password)
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    require_user
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

   

