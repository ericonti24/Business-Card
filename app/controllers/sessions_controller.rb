class SessionsController < ActionController::Base
  def welcome
  end

  def new
  end

  def create
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id 
      redirect_to user_path(u)
    else
      flash[:message] = "Invalid credentials. Please try again."
      redirect_to '/login', alert: "Invalid cedentials. Please try again."
    end
  end

  def destroy 
    session.delete(:user_id)
    redirect_to '/login'
  end

  def omniauth 
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(u)
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