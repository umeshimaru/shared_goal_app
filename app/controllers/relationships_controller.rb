class RelationshipsController < ApplicationController
  before_action :set_q,only: %i[new]
  def new
    @friend_user = User.find(params[:id])
  end

  def create
  end

  def destroy
  end

  private 

  def set_q
    @q = User.ransack(params[:q])
  end
end
