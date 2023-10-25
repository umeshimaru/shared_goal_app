class ApplicationController < ActionController::Base
  before_action :set_q

  private

  def after_sign_in_path_for(resource)
    my_goal_monthly_goal_path(resource)
  end
  

  def set_q
    @q = User.ransack(params[:q])
    @results = @q.result
  end
end
