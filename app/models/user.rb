class User < ActiveRecord::Base

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise 	:database_authenticatable, :registerable,
       		:recoverable, :rememberable, :trackable, :validatable,
            :omniauthable, :omniauth_providers => [:facebook],
            authentication_keys: [:username]

  	before_save { email.downcase! }

	has_many :gitlinks

  	validates :name, :presence => true, length: { maximum: 50 }
  	validates :username, :presence => true, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive: false }

    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            user.name = auth.info.name  
            user.username = auth.info.first_name || auth.info.name
            # user.image = auth.info.image 
        end
    end
end
