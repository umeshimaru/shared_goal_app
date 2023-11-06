class UsersController < ApplicationController
  before_action :set_q,only: %i[ search]
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

  def search
    @users = User.find_others(params[:key])
    respond_to do |format|
      format.json { render json: @users }
      format.html { render :index}
    end

end 

  private 

  def set_q
    @q = User.ransack(params[:q])
  end

  



end
