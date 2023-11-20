class RelationshipsController < ApplicationController
  before_action :set_q,       only: %i[new create requests_status]
  before_action :friend_user, only: %i[new create ]
  def new
    @user = current_user
    @relationship = Relationship.new
  end

   #can_follow?メソッドの引数の可読性を上げるために@other_usersを作成しました。
  def create
    @other_user =  params[:relationship][:reciever_id]
   if current_user.can_follow?(@other_user,current_user)
    current_user.follow(@other_user,relationship_params,current_user) 
    redirect_to  my_goal_monthly_goal_path(current_user), notice: "友達申請を送信しました"
   else
    redirect_to  my_goal_monthly_goal_path(current_user),flash: { alert: "友達申請送信失敗しました"  }
   end
  end 


  def destroy   
  end

  def requests_status
    @friend_request_reciever = current_user.reciever_relationships
    @friend_request_sender =  Relationship.get_sender(@friend_request_reciever)
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
