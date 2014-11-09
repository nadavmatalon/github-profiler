describe "Profile page" do

	subject { page }

	context "Minimal Profile Details" do

		before (:each) do
			minimal_profile_sign_up
			click_link "Profile"
		end

	   	it "should have page title \'Github Profiler | Profile\'" do
	        should have_title("Github Profiler | Profile")
	    end

		it "should have the content \'GITHUB PROFILER\'" do
			should have_content "GITHUB PROFILER"
		end

		it "should have the content \'My Profile\'" do
			should have_content "My Profile"
		end

		it "should show \'n/a\'for user\'s name if not available" do
			should have_content "Name n/a"
		end

		it "should show \'n/a\'for user\'s location if not available" do
			should have_content "Location n/a"
		end

		it "should show \'n/a\'for user\'s email if not available" do
			should have_content "Email n/a"
		end

		it "should show \'n/a\'for user\'s Github Page if not available" do
			should have_content "Github Page n/a"
		end
	end

	context "Full Profile Details" do

	    before (:each) do
			full_profile_sign_up
			click_link "Profile"
		end

		it "should show the user\'s username" do
			should have_content "test_username"
		end

		it "should show the user\'s name if available" do
			should have_content "test_user"
		end

		it "should show the user\'s location if available" do
			should have_content "test_location"
		end

		it "should show the user\'s email if available" do
			should have_content "username@email.com"
		end

		it "should show the user\'s Github page url if available" do
			should have_content "http://user_website.com"
		end
	end
end

def minimal_profile_sign_up
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: "test_username"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
end

def full_profile_sign_up
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: "test_username"
    fill_in "user_name", with: "test_user"
    fill_in "user_location", with: "test_location"
    fill_in "user_email", with: "username@email.com"
    fill_in "user_url", with: "http://user_website.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
end

