class RelationshipsController < ApplicationController
  before_action :set_q,only: %i[new create requests_status]
  def new
    @friend_user = User.find(params[:id])
    @user = current_user
  end

  def create
  end

  def destroy
  end

  def requests_status
    @user = User.find(params[:id])
  end



  private 

  def set_q
    @q = User.ransack(params[:q])
  end
end
