class SessionsController < ActionController::Base

  def create 
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:notice] = "Logged in successfully."
      redirect_to business_card_path(@user)
    else
      flash.now[:alert] = "Incorrect username or password. "
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to '/'
  end

end