class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    my_goal_monthly_goal_path(resource)
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password_confirmation,])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
