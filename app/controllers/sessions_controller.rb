class SessionsController < ActionController::Base
  def welcome
  end

  def new
  end

  def destroy
    session.clear 
    redirect_to '/login'
  end

  def create
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id 
      redirect_to new_business_card_path
    else
      flash[:message] = "Invalid credentials. Please try again."
      redirect_to '/login', alert: "Invalid cedentials. Please try again."
    end
  end

  def omniauth 
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to new_business_card_path
    else
      flash[:message] = user.errors.full_message.join(", ")
      redirect_to user_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end