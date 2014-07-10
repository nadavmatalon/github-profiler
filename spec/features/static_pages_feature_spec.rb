require 'rails_helper'

describe "Static pages: " do
	
	subject { page }

	describe "\'root\' page" do
		
		it "should have the content 'StaticPages#home'" do
			visit root_path
			should have_content("StaticPages#home")
		end
	end

	describe "Home page" do
		
		it "should have the content 'StaticPages#home'" do
			visit home_path
			should have_content("StaticPages#home")
		end		
	end

	describe "About Us page" do
		
		it "should have the content 'StaticPages#about'" do
			visit about_path
			should have_content("StaticPages#about")
		end
	end

	describe "Contact Us page" do
	
		it "should have the content 'StaticPages#contact'" do
			visit contact_path
			should have_content("StaticPages#contact")
		end
	end

	describe "Help page" do
		
		it "should have the content 'StaticPages#help'" do
			visit help_path
			should have_content("StaticPages#help")
		end
	end
end
