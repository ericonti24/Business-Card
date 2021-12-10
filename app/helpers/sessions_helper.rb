module SessionsHelper
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
     
    def logged_in?
        !!current_user
    end
     
    def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action."
          redirect_to login_path
        end
    end

    def render_nav_bar
        if logged_in?
            render partial: 'layouts/loggedin_links'
        else
            render partial:'layouts/loggedout_links'
        end
    end
end