describe "Gitlinks" do

	it 'can be created and saved in the database' do
		expect(Gitlink.count).to eq 0
		create_gitlink
		expect(Gitlink.count).to eq 1
	end

	it 'can be retrieved from he database' do
		create_gitlink
		expect(Gitlink.first.link).to eq "test_link"
	end

	it 'can be removed from the database' do
		create_gitlink
		Gitlink.first.destroy
		expect(Gitlink.count).to eq 0
	end		
end

def create_gitlink
	Gitlink.create(link: "test_link")
end

