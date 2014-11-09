describe "Home page" do

	subject { page }

	before (:each) { visit root_path }

	it "should have page title \'Github Profiler | Home\'" do
		should have_title("Github Profiler | Home")
	end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have a \'Search\' field" do
		should have_field "user_name"
	end

	it "should have a \'Search\' button" do
		should have_button "Search"
	end
end

