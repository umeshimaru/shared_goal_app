class UsersController < ApplicationController
  before_action :set_q,only: %i[search]
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
    @users = User.find_others(params[:key],current_user)
    respond_to do |format|
      format.json { render json: @users }
      format.html { render :index}
    end

end 
def friend_goal
  relationship =  Relationship.where("(sender_id = ? OR reciever_id  = ? AND checked = ? )", current_user.id, current_user.id, true)
  relationship.each do |relationship|
    if relationship.sender_id == current_user.id
     @friend_user = relationship.reciever
     @frind_monthly_goal = @friend_user.monthly_goal
     @days_until_achievement = @frind_monthly_goal.calc_days(@frind_monthly_goal.goal_achieved_at)
     @weekly_goals = @friend_user.weekly_goals
     @events = @friend_user.collect_user_events(@weekly_goals)
     @task = Task.new
    else
     @friend_user = relationship.sender
     @frind_monthly_goal = @friend_user.monthly_goal
     @days_until_achievement = @frind_monthly_goal.calc_days(frind_monthly_goal.goal_achieved_at)
     @weekly_goals = @friend_user.weekly_goals
     @events = friend_user.collect_user_events(@weekly_goals)
     @task = Task.new
    end
 
  end 


  

  

end

  private 

  def set_q
    @q = User.ransack(params[:q])
  end

  



end
