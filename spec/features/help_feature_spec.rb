describe "Help page" do

	subject { page }

	before (:each) { visit help_path }

	it "should have page title \'Github Profiler | Help\'" do
		should have_title "Github Profiler | Help"
	end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Help\'" do
		should have_content "Help"
	end

end

