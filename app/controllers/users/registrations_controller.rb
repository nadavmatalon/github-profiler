class Users::RegistrationsController < Devise::RegistrationsController

    def update
        @user = User.find(current_user.id)
        account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
        check_params
        update_user_attributes
    end

    def check_params
        check_password_params
        check_email_params
        check_current_password
    end

    def check_password_params
        if account_update_params[:password].blank?
            account_update_params.delete("password")
            account_update_params.delete("password_confirmation")
        end
    end

    def check_email_params
        if account_update_params[:email].blank?
            account_update_params.delete("email")
        end
    end

    def check_current_password
        if account_update_params[:current_password].blank?
            account_update_params.delete("current_password")
        end
    end

    def update_user_attributes
        if @user.update_attributes(account_update_params)
            set_flash_message :notice, :updated
            sign_in @user, bypass: true
            redirect_to after_update_path_for(@user)
        else
            render "edit"
        end
    end
end

