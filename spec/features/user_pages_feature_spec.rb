require 'rails_helper'

describe "User Pages >" do

    subject { page }

	describe "Sign Up page: " do

        before (:each) { visit sign_up_path }

		it "should have the content \'Sign up\'" do
			should have_content("Sign up")
		end

        it "should have the base and page title" do
            should have_title("Web Template | Sign Up")
        end
    end

    describe "Sign In page: " do

        before (:each) { visit sign_in_path }

		it "should have the content \'Sign in\'" do
			should have_content("Sign in")
		end

        it "should have the base and page title" do
            should have_title("Web Template | Sign In")
        end
    end

    describe "Edit Account Details page: " do

		it "should have the content \'Edit Account Details\'" do
	    	sign_up
			click_link 'edit account'
  		  	should have_content 'Edit Account Details'
  		end
    end
end

def sign_up
	visit home_path
	click_link 'sign up'
	within '.new_user' do
		fill_in :user_name, with: 'John Apple'
		fill_in :user_username, with: 'ja'
		fill_in :user_email, with: 'ja@gmail.com'
		fill_in :user_password, with: '12345678'
		fill_in :user_password_confirmation, with: '12345678'
		click_button 'Sign up'
	end
end



 
# save_and_open_page

# @request.env["devise.mapping"] = Devise.mappings[:user]

