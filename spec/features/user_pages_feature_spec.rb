require 'rails_helper'

describe "User Pages >" do

    subject { page }

	describe "Sign Up page: " do

        before (:each) { visit sign_up_path }

		it "should have the content \'Sign up\'" do
			should have_content("Sign up")
		end

        # it "should have the base and page title" do
            # should have_title("Web Template | Sign Up")
        # end
    end
end


# @request.env["devise.mapping"] = Devise.mappings[:user]