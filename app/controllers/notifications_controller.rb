class NotificationsController < ApplicationController
  def index 
    @notifications = current_user.passive_notifications.where.not(checked:true)
    

end
end 
