describe "Users" do

	it 'can be created and saved in the database' do
		expect(User.count).to eq 0
		create_user
		expect(User.count).to eq 1
	end

	it 'do not have their passowrd saved in the database' do
		create_user
		expect(User.first.password).to eq nil
	end

	it 'have their passowrd saved in the database as an encrypted hash' do
		create_user
		expect(User.first.encrypted_password.to_s).not_to eq "password"
	end

	it 'can be retrieved from he database' do
		create_user
		expect(User.first.username).to eq "test_user"
	end

	it 'can be removed from the database' do
		create_user
		User.first.destroy
		expect(User.count).to eq 0
	end

	it 'initially have no gitlinks' do
		create_user
		expect(User.first.gitlinks.count).to eq 0
	end

	it 'can have a gitlink' do
		create_user
		User.first.gitlinks.create(link: "text_link")
		expect(User.first.gitlinks.count).to eq 1
	end

	it 'can have more than one gitlink' do
		create_user
		User.first.gitlinks.create(link: "text_link")
		User.first.gitlinks.create(link: "another_link")
		expect(User.first.gitlinks.count).to eq 2
	end
end

def create_user
	User.create(username: "test_user", password: "password", password_confirmation: "password")
end

