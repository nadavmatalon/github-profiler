
describe "Search function" do

	subject { page }

	before do
		visit root_path
		fill_in "user_name", with: "nadavmatalon"
		click_button "Search"
	end

	it "should have a \'Search\' button" do
		
	end

end