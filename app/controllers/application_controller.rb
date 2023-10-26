class ApplicationController < ActionController::Base
  

  private

  def after_sign_in_path_for(resource)
    my_goal_monthly_goal_path(resource)
  end
  


end
