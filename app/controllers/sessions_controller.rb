class SessionsController < ActionController::Base

    def welcome
    end

    def new
    end

    def destroy
      session.clear 
      redirect_to '/'
    end

    def create
      if params[:provider] == 'google_oauth2'
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
       redirect_to user_path(@user)
      else
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(password: params[:user][:password])
        end
      end
    end

    def omniauth 
      @user = User.create_by_google_omniauth(auth)
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to '/'
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end
end