describe "About page" do

	subject { page }

	before (:each) { visit about_path }

	it "should have page title \'Github Profiler | About\'" do
		should have_title "Github Profiler | About"
	end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'About Us\'" do
		should have_content "About Us"
	end

end

