class StaticPagesController < ApplicationController

    def home
    end

    def about
    end

    def contact
    end

    def help
    end

    def profile
        if !current_user
            redirect_to root_path
        end
    end
end
