class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :is_admin?

    def is_admin?
        signed_in? ? current_user.admin : false
    end

    def authorize_admin
        unless current_user.admin
          redirect_to root_path, alert: 'Admins only!'
        end
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :photo])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :photo])
    end
end
