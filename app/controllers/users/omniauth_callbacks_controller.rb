class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        # puts ("|----------------------------------|")
        # puts (@user)
        # puts ("|----------------------------------|")
        if @user.present?
            sign_in @user
            @current_user = @user
            redirect_to root_path(@user)
            set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
        else
            session["devise.github_data"] = request.env["omniauth.auth"]
            # puts ("|----------------------------------|")
            # puts (session["devise.github_data"])
            # puts ("|----------------------------------|")
            redirect_to root_path
        end
    end
 
 #  def facebook
 #    	@user = User.from_omniauth(request.env["omniauth.auth"])
 #    	if @user.persisted?
 #      		sign_in_and_redirect @user, :event => :authentication
 #      		set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
 #    	else
 #      		session["devise.facebook_data"] = request.env["omniauth.auth"]
 #            set_flash_message(:notice, :faliure, :kind => "Facebook") if is_navigational_format?
 #      		redirect_to home_path
 #    	end
 #  end

end
