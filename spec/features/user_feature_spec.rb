
feature "Users" do

	context "Sign up" do

		scenario "users can sign up with just username and password" do
			minimal_user_sign_up
			expect(page).to have_content ("Welcome test_user")
		end

		scenario "users can provide their location on sign up" do
			full_user_sign_up
			click_link "Profile"
			expect(page).to have_content ("test_location")
		end

		scenario "users can provide their email on sign up" do
			full_user_sign_up
			click_link "Profile"
			expect(page).to have_content ("user@email.com")
		end

		scenario "users can provide their Github homepage on sign up" do
			full_user_sign_up
			click_link "Profile"
			expect(page).to have_content ("http://user_domain.com")
		end

		scenario "users are re-directed to the homepage after signing up" do
			minimal_user_sign_up
			expect(current_path).to eq root_path
		end

		scenario "users are shown the correct message after signing up" do
			minimal_user_sign_up
			expect(page).to have_content "Signed up successfully"
		end

		scenario "users cannot sign up again after sign up without signing out first" do
			minimal_user_sign_up
			expect(page).not_to have_link "Sign up"
			expect(page).not_to have_link "Sign in"
		end

		scenario "users have the option to sign out after signing up" do
			minimal_user_sign_up
			expect(page).to have_link "Sign out"
		end

		scenario "users cannot sign up with a password that doesn\'t match" do
			minimal_user_sign_up('test_user', 'password_a', 'password_b')
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if password doesn\'t match confirmation" do
			minimal_user_sign_up('test@example.com', 'password_a', 'password_b')
			expect(page).to have_content "password confirmation doesn't match password"
		end

		scenario "users cannot sign up with a password that is less than 6 chars" do
			minimal_user_sign_up('test_user', 'pass', 'pass')
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if password is less than 6 chars on sign up" do
			minimal_user_sign_up('test_user', 'pass', 'pass')
			expect(page).to have_content "password is too short (minimum is 6 characters)"
		end

		scenario "users cannot sign up with an empty username" do
			minimal_user_sign_up('', 'password', 'password')
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if username is empty on sign up" do
			minimal_user_sign_up('', 'password', 'password')
			expect(page).to have_content "username can't be blank"
		end

		scenario "users cannot sign up with a username that\'s already taken" do
			register_user
			minimal_user_sign_up
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if username is already taken" do
			register_user
			minimal_user_sign_up
			expect(page).to have_content "username has already been taken"
		end

		scenario "users cannot sign up with an invalid email" do
			full_user_sign_up("test_user", "test_name", "test_location", 
				"incorrect_email", "http://user_domain.com", "password", "password")
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if email is invalid on sign up" do
			full_user_sign_up("test_user", "test_name", "test_location", 
				"incorrect_email", "http://user_domain.com", "password", "password")
			expect(page).to have_content "email is invalid"
		end

		scenario "users cannot sign up with an invalid Github page url" do
			full_user_sign_up("test_user", "test_name", "test_location", 
				"user@email.com", "wrong_url", "password", "password")
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown the correct error message if email is invalid on sign up" do
			full_user_sign_up("test_user", "test_name", "test_location", 
				"user@email.com", "wrong_url", "password", "password")
			expect(page).to have_content "url is invalid"
		end

		scenario "username is case insensitive" do
			register_user
			minimal_user_sign_up('TEST_USER', 'password', 'password')
			expect(page).to have_content "Welcome Guest"
			expect(page).not_to have_link "Sign out"
		end

		scenario "users remain on sign up page on unsuccessful sign up" do
			minimal_user_sign_up('test_user', 'pass', 'pass')
			expect(current_path).to eq user_registration_path
		end

	end

	context "Sign in" do

		scenario "users can sign in with correct credentials" do
			register_user
			sign_in
			expect(page).to have_link "Sign out"
		end

		scenario "users are shown the correct message after signing in" do
			register_user
			sign_in
			expect(page).to have_content("Welcome test_user")
			expect(page).to have_content "Signed in successfully"
		end

		scenario "users are re-directed to the homepage after signing in" do
			register_user
			sign_in
			expect(current_path).to eq root_path
		end

		scenario "users cannot sign in after signing in without signing out first" do
			register_user
			sign_in
			expect(page).not_to have_link "Sign up"
			expect(page).not_to have_link "Sign in"
		end

		scenario "users cannot sign in with incorrect username" do
			register_user
			sign_in("wrong_username", "password")
			expect(page).to have_content("Welcome Guest")
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown correct error message if username is wrong on sign in" do
			register_user
			sign_in("wrong_username", "password")
			expect(page).to have_content("Invalid email or password")
		end

		scenario "users cannot sign in with incorrect password" do
			register_user
			sign_in("test_user", "wrong")
			expect(page).to have_content("Welcome Guest")
			expect(page).not_to have_link "Sign out"
		end

		scenario "users are shown correct error message if password is wrong on sign in" do
			register_user
			sign_in("test_user", "wrong")
			expect(page).to have_content("Invalid email or password")
		end
	end


	context "Sign out" do

		scenario "users can sign out if already signed in" do
			register_user
			sign_in
			click_link "Sign out"
			expect(page).not_to have_content("Welcome test_user")
		end

		scenario "users are shown the correct message when signing out" do
			register_user
			sign_in
			sign_out
			expect(page).to have_content("Signed out successfully")
		end

		scenario "users cannot sign out if already signed out" do
			register_user
			sign_in
			sign_out
			expect(page).not_to have_button "Sign out"
			expect(page).to have_content("Welcome Guest")
		end

	end

	context "Delete Account" do

		scenario "users can delete their account" do
			register_user
			sign_in
			click_link "Account"
			click_button "Delete my account"		
			expect(page).not_to have_button "Sign out"
			expect(page).to have_content "Welcome Guest"
			sign_in
			expect(page).to have_content "Invalid email or password"
		end

		scenario "users are shown the correct message after deleting their account" do
			register_user
			sign_in
			click_link "Account"
			click_button "Delete my account"		
			expect(page).to have_content "Account successfully deleted"
		end

		scenario "users are signed out after deleting their account" do
			register_user
			sign_in
			click_link "Account"
			click_button "Delete my account"		
			expect(page).to have_content "Welcome Guest"
			expect(page).to have_link "Sign in"
			expect(page).to have_link "Sign in"
			expect(page).to have_link "Sign up"
			expect(page).not_to have_link "Sign out"
		end
	end

	context "Change Account Details" do

		before (:each) do
			full_user_sign_up
			click_link "Account"
		end

		scenario "users can change their username" do
			fill_in "user_username", with: "new_username"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			click_link "Profile"		
			expect(page).not_to have_content "Username test_user"
			expect(page).to have_content "Username new_username"
		end

		scenario "users can change their name" do
			fill_in "user_name", with: "new_name"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			click_link "Profile"		
			expect(page).not_to have_content "Name test_name"
			expect(page).to have_content "Name new_name"
		end

		scenario "users can change their location" do
			fill_in "user_location", with: "new_location"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			click_link "Profile"		
			expect(page).not_to have_content "Location test_location"
			expect(page).to have_content "Location new_location"
		end

		scenario "users can change their email" do
			fill_in "user_email", with: "new@email.com"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			click_link "Profile"		
			expect(page).not_to have_content "user@email.com"
			expect(page).to have_content "new@email.com"
		end

		scenario "users can change their Github page url" do
			fill_in "user_url", with: "http://new_domain.com"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			click_link "Profile"		
			expect(page).not_to have_content "http://user_domain.com"
			expect(page).to have_content "http://new_domain.com"
		end

		scenario "users can change their password" do
			fill_in "user_password", with: "new_password"
			fill_in "user_password_confirmation", with: "new_password"
			click_button "Update"
			expect(page).to have_content "Account updated successfully"
			sign_out
			sign_in("test_user", "new_password")
			expect(page).to have_content "Welcome test_user"
		end
	end
end


def register_user
    minimal_user_sign_up
    sign_out
end

def minimal_user_sign_up(username = "test_user", password = "password", 
            password_confirmation = "password")
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button "Sign up"
end

def full_user_sign_up(username = "test_user", name = "test_name",
			location = "test_location", email = "user@email.com",
			url = "http://user_domain.com", password = "password", 
            password_confirmation = "password")
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: username
    fill_in "user_name", with: name
    fill_in "user_location", with: location
    fill_in "user_email", with: email
    fill_in "user_url", with: url
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button "Sign up"
end

def sign_in(username = "test_user", password = "password")
    visit root_path
    click_link "Sign in"
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    click_button "Sign in"
end

def sign_out
    visit root_path
    click_link "Sign out"
end


# 	@request.env["devise.mapping"] = Devise.mappings[:user]

