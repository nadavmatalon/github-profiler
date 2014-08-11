
describe "Github Profiles", js: :true do
 
	it "can be searched for in the homepage" do
        visit root_path
		fill_in "user_name", with: "nadavmatalon"
		click_button "Search"
        expect(page).to have_content "nadavmatalon"
	end

    it "successful search gives correct message" do
        visit root_path
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        expect(page).to have_content "Github profile found!"
    end

   it "unsuccessful search gives correct message" do
        visit root_path
        fill_in "user_name", with: "820830 2830983  0293809238"
        click_button "Search"
        expect(page).to have_content "Sorry, profile not found"
    end

    it "cannot be saved if user is not signed in" do
        visit root_path
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        expect(page).to have_content "nadavmatalon"
        expect(page).not_to have_button "Save Profile"
    end

   it "can be saved if user is signed in" do
        user_gitlink_sign_up
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        expect(page).to have_button "Save Profile"
    end

    it "are stored in db after being saved by user" do
        user_gitlink_sign_up
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        click_button "Save Profile"
        sleep 0.5
        expect(User.first.gitlinks.count).to eq 1
    end

   it "are stored in db after being saved by user" do
        user_gitlink_sign_up
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        click_button "Save Profile"
        expect(page).to have_content "Profile successfully saved!"
    end

    it "are shown in user\'s Github Profile page after being saved" do
        user_gitlink_sign_up
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        click_button "Save Profile"
        visit github_profile_path
        expect(page).to have_content "nadavmatalon"
    end

    it "have a link to origin when shown Github Profile page after being saved" do
        user_gitlink_sign_up
        fill_in "user_name", with: "nadavmatalon"
        click_button "Search"
        click_button "Save Profile"
        visit github_profile_path
        expect(page).to have_link "nadavmatalon"
    end
end


def user_gitlink_sign_up(username = "test_user", password = "password", 
            password_confirmation = "password")
    visit "/"
    click_link "Sign up"
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button "Sign up"
end