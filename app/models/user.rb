class User < ActiveRecord::Base

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable, :validatable,
  	devise 	:database_authenticatable, :registerable, 
       		:recoverable, :rememberable, :trackable, 
            :omniauthable, :omniauth_providers => [:github],
            authentication_keys: [:username]
            # :omniauthable, :omniauth_providers => [:facebook],

    before_save { email.downcase! }

	has_many :gitlinks

    validates_confirmation_of :password, on: :create
    validates :name, length: { maximum: 50 }
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, on: :create
    validates_format_of :email, with: Devise.email_regexp, allow_blank: true
    validates_format_of :url, with: URI.regexp(['http']), allow_blank: true


    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.username = auth.extra.raw_info.login
            user.name = auth.extra.raw_info.name
            user.location = auth.extra.raw_info.location
            user.email = auth.extra.raw_info.email
            user.url = auth.extra.raw_info.html_url
            user.github_id = auth.extra.raw_info.id
            user.password = Devise.friendly_token[0,20]
        end
    end

    # for facebook:

    # def self.from_omniauth(auth)
    #     where(auth.slice(:provider, :uid)).first_or_create do |user|
    #         user.email = auth.info.email
    #         user.password = Devise.friendly_token[0,20]
    #         user.name = auth.info.name  
    #         user.username = auth.info.first_name || auth.info.name
    #         # user.image = auth.info.image 
    #     end
    # end
end
