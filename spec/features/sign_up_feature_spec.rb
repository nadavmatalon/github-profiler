describe "Sign up page" do

	subject { page }

    before (:each) { visit new_user_registration_path }

   	it "should have page title \'Github Profiler | Sign Up\'" do
        should have_title("Github Profiler | Sign Up")
    end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Sign up\'" do
		should have_content "Sign up"
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

	it "should have button \'Sign up\'" do
		should have_button "Sign up"
	end
end



