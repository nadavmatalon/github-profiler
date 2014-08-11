describe "Gitlinks" do

 #    it 'should not have JavaScript errors', :js => true do
 #      visit(root_path)
 #      expect(page).not_to have_errors
 #    end

	# it "can be searched for in the homepage" do
	# 	user_gitlink_sign_up
	# 	fill_in "user_name", with: "nadavmatalon"
	# 	click_button "Search"

	# end

end

def user_gitlink_sign_up(username = "test_user", password = "password", 
            password_confirmation = "password")
    visit root_path
    click_link "Sign up"
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirmation
    click_button "Sign up"
end