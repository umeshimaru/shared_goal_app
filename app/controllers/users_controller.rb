class UsersController < ApplicationController

  def home
  end

  def new
    
  end

  def create 
    if @user.save
      
    else
      render template: " sessions/new"
    end
  end

  def set_goal

  end

  def my_page
    
  end

end
