require 'rails_helper'

describe "Static pages: " do
	
	subject { page }

	describe "\'root\' page" do
		
		before (:each) { visit root_path }

		it "should have the title \'Web Templates | Home\'" do
			should have_title("Web Template | Home")
		end

		it "should have the content \'Web Templates\'" do
			should have_content("WEB TEMPLATE")
		end
	end

	describe "Home page" do
		
		before (:each) { visit home_path }

		it "should have the title \'Web Template | Home\'" do
			should have_title("Web Template | Home")
		end		

		it "should have the content 'Web Template'" do
			should have_content("WEB TEMPLATE")
		end	

		it "should have links for \'sign up\' and \'sign in\' if user is not signed in" do
	    	expect(page).to have_link 'sign up'
  		  	expect(page).to have_link 'sign in'
  		end

		it "should have links for \'edit account\' and \'sign out\' if user is signed in" do
	    	sign_up
	    	expect(page).to have_link 'edit account'
  		  	expect(page).to have_link 'sign out'
  		end

  		it "should have the content \'Welcome, user\' if user isn\'t signed in" do
	    	expect(page).to have_content 'Welcome user,'
  		end

  		it "should have the content \'Welcome, @username\' if user signed in" do
			sign_up
	    	expect(page).to have_content 'Welcome ja,'
  		end
    end

	describe "About Us page" do

		before (:each) { visit about_path }
		
		it "should have the title \'Web Template | About\'" do
			should have_title("Web Template | About")
		end

		it "should have the content \'About Us\'" do
			should have_content("About Us")
		end
	end

	describe "Contact Us page" do
	
		before (:each) { visit contact_path }

		it "should have the title \'Web Template | Contact\'" do
			should have_title("Web Template | Contact")
		end

		it "should have the content \'Contact Us\'" do
			should have_content("Contact Us")
		end
	end

	describe "Help page" do

		before (:each) { visit help_path }
		
		it "should have the content \'Web Template | Help\'" do
			should have_title("Web Template | Help")
		end

		it "should have the content \'Help\'" do
			should have_content("Help")
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


