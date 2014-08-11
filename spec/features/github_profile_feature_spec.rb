describe "Github Profile page" do

	subject { page }

	before (:each) do
		github_profile_sign_up
		click_link "Github Profile"
	end

   it "should have page title \'Github Profiler | Github Profile\'" do
        should have_title("Github Profiler | Github Profile")
    end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Github Profile\'" do
		should have_content "Github Profile"
	end

	it "should show user\'s username" do
		within (".git-profile-info") do
			should have_content "test_username"
		end
	end
	
	it "should have the content \'Public Repos\'" do
		should have_content "Public Repos"
	end

	it "should have the content \'Saved Profiles\'" do
		should have_content "Saved Profiles"
	end

	it "should have the content \'No saved profiles yet\'" do
		should have_content "No saved profiles yet"
	end
end


def github_profile_sign_up
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: "test_username"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
end

