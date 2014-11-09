class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_in) { |user| user.permit(:username, :password, :remember_me) }
    	devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:name, :username, :email, :location, :url, :password, :password_confirmation) }
    	devise_parameter_sanitizer.for(:account_update) { |user| user.permit(:name, :username, :email, :location, :url, :password, :password_confirmation, :current_password) }
    	devise_parameter_sanitizer.for(:password_edit) { |user| user.permit(:name, :username, :email, :password, :password_confirmation, :current_password) }
    	devise_parameter_sanitizer.for(:password_new) { |user| user.permit(:name, :username, :email, :password, :password_confirmation, :current_password) }
    end

end
