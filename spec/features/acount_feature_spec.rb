describe "Account page" do

	subject { page }

    before (:each) do
    	sign_up
    	visit edit_user_registration_path
    end

   	it "should have page title \'Github Profiler | Account\'" do
        should have_title("Github Profiler | Account")
    end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Account Details\'" do
		should have_content "Account Details"
	end

	it "should have the field \'Username\'" do
		should have_field "user_username"
	end

	it "should have the field \'Name\'" do
		should have_field "user_name"
	end

	it "should have the field \'Location\'" do
		should have_field "user_location"
	end

	it "should have the field \'Email\'" do
		should have_field "user_email"
	end

	it "should have the field \'Github Page\'" do
		should have_field "user_url"
	end

	it "should have the field \'Passowrd\'" do
		should have_field "user_password"
	end

	it "should have the field \'Password Confirmation\'" do
		should have_field "user_password_confirmation"
	end

	it "should have button \'Update\'" do
		should have_button "Update"
	end

	it "should have button \'Delete my account\'" do
		should have_button "Delete my account"
	end
end

def sign_up(username = "test_user", password = "password", 
            password_confirmation = "password")
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button "Sign up"
end


