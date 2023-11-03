class RelationshipsController < ApplicationController
  before_action :set_q,       only: %i[new create requests_status]
  before_action :friend_user, only: %i[new create ]
  def new
    @user = current_user
    @relationship = Relationship.new
    #ここではいかいいえの表示を調整する。senderかrecieverだったらはいを非表示falseだったら表示
  end

  def create
    #ここbuildメソッドに書きなおす。理由もし同時に
    current_user.create_sender_relationships(relationship_params)
  end

  def destroy   
  end

  def requests_status
  
   byebug
    
    #ここに記載する記載する(senderかrecieverかのデータ取得)、そのデータから
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
