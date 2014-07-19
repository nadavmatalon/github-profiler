class StaticPagesController < ApplicationController

  # before_filter :authenticate_user!, except: [:home, :about, :contact, :help]

  def home
  end

  def about
  end

  def contact
  end

  def help
  end
  
  def profile
    if current_user.nil?
      redirect_to '/home'
    end
  end
end
