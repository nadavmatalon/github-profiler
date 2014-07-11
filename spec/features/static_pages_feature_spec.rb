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
