class Gitlink < ActiveRecord::Base

  	belongs_to :User

  	validates :link, :presence => true, uniqueness: { :message => "gitlink already in databes", case_sensitive: false }

 #    property :id, Serial
	# property :link, String
	# property :user_id, Integer


end
