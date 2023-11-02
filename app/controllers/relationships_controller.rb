class RelationshipsController < ApplicationController
  before_action :set_q,       only: %i[new create requests_status]
  before_action :friend_user, only: %i[new create ]
  def new
    @user = current_user
    @relationship = Relationship.new
  end

  def create
    
    current_user.create_sender_relationships(relationship_params)

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

  def relationship_params
    params.require(:relationship).permit(:sender_id,:reciever_id )
  end 

  def friend_user
    @friend_user = User.find(params[:id])
  end
end
