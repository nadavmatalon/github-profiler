class GitlinksController < ApplicationController
# class GitlinksController < ActionController::Base

	def new
    	@current_user = current_user
    	@gitlink = Gitlink.new
  	end

	def create
		current_user = User.find params[:user]
		@gitlink = current_user.gitlinks.create(link: params[:content])
		redirect_to '/home' unless request.xhr?
	end

	def gitlinks_params
    	params[:create_gitlink].permit(:user, :link)
  	end

end


  