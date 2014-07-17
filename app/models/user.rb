class User < ActiveRecord::Base

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise 	:database_authenticatable, :registerable,
       		:recoverable, :rememberable, :trackable, :validatable,
        	authentication_keys: [:username]

  	before_save { email.downcase! }

	has_many :gitlinks

  	validates :name, :presence => true, length: { maximum: 50 }
  	validates :username, :presence => true, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive: false }

end
