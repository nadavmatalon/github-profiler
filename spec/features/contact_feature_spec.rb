describe "Contact page" do

	subject { page }

	before (:each) { visit contact_path }

	it "should have page title \'Github Profiler | Contact\'" do
		should have_title "Github Profiler | Contact"
	end

	it "should have the content \'GITHUB PROFILER\'" do
		should have_content "GITHUB PROFILER"
	end

	it "should have the content \'Contact Us\'" do
		should have_content "Contact Us"
	end

end

