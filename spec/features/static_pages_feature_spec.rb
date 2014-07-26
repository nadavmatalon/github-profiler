require 'rails_helper'

describe "Static pages: " do
	
	subject { page }

	describe "\'root\' page" do
		
		before (:each) { visit root_path }

		it "should have the title \'Github Profiler | Home\'" do
			should have_title("Github Profiler | Home")
		end

		it "should have the content \'GITHUB PROFILER\'" do
			should have_content("GITHUB PROFILER")
		end
	end

	describe "Home page" do
		
		before (:each) { visit home_path }

		it "should have the title \'Github Profiler | Home\'" do
			should have_title("Github Profiler | Home")
		end

		it "should have the content \'GITHUB PROFILER\'" do
			should have_content("GITHUB PROFILER")
		end

		it "should have links for \'Sign up\' and \'Sign in\' if user is not signed in" do
	    	expect(page).to have_link 'Sign up'
  		  	expect(page).to have_link 'Sign in'
  		end

		it "should have links for \'Account\' and \'Sign out\' if user is signed in" do
	    	sign_up
	    	expect(page).to have_link 'Account'
  		  	expect(page).to have_link 'Sign out'
  		end

  		it "should have the content \'Welcome Guest\' if user isn\'t signed in" do
	    	expect(page).to have_content 'Welcome Guest'
  		end

  		it "should have the content \'Welcome @username\' if user signed in" do
			sign_up
	    	expect(page).to have_content 'Welcome ja'
  		end
    end

	describe "About Us page" do

		before (:each) { visit about_path }
		
		it "should have the title \'Github Profiler | About\'" do
			should have_title("Github Profiler | About")
		end

		it "should have the content \'About Us\'" do
			should have_content("About Us")
		end
	end

	describe "Contact Us page" do
	
		before (:each) { visit contact_path }

		it "should have the title \'Github Profiler | Contact\'" do
			should have_title("Github Profiler | Contact")
		end

		it "should have the content \'Contact Us\'" do
			should have_content("Contact Us")
		end
	end

	describe "Help page" do

		before (:each) { visit help_path }
		
		it "should have the content \'Github Profiler | Help\'" do
			should have_title("Github Profiler | Help")
		end

		it "should have the content \'Help\'" do
			should have_content("Help")
		end
	end
end

def sign_up
	visit home_path
	click_link 'Sign up'
	within '.new_user' do
		fill_in :user_name, with: 'John Apple'
		fill_in :user_username, with: 'ja'
		fill_in :user_email, with: 'ja@gmail.com'
		fill_in :user_password, with: '12345678'
		fill_in :user_password_confirmation, with: '12345678'
		click_button 'Sign up'
	end
end


