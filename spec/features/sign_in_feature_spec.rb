describe "Sign in page" do

	subject { page }

    before (:each) { visit new_user_session_path }

   it "should have page title \'Github Profiler | Sign In\'" do
        should have_title("Github Profiler | Sign In")
    end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Sign in\'" do
		should have_content "Sign in"
	end

	it "should have the field \'Username\'" do
		should have_field "user_username"
	end

	it "should have the field \'Passowrd\'" do
		should have_field "user_password"
	end

	it "should have a \'remember me\' checkbox" do
		should have_field ("user_remember_me")
	end

	it "should have the content \'Remember me\'" do
		should have_content ("Remember me")
	end

	it "should have button \'Sign in\'" do
		should have_button "Sign in"
	end
end



