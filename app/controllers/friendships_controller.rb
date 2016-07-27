class FriendshipsController < ApplicationController
	before_action :authenticate_user! 
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
  def guest_friend_request
  guest=current_user.friendships.create(friend_id:params[:friend_id],status:"pending")
  redirect_to root_path, notice:"request send !"  
  end
  
  def accept_friend_request
  	current_user.inverse_friendships.where(user_id:params[:friend_id],status:"pending").update(status:"accept")
  	redirect_to root_path, notice:"accepted friendship !"
  end
  def reject_friend_request
  	current_user.inverse_friendships.where(user_id:params[:friend_id],status:"pending").first.destroy
  	redirect_to root_path, notice:"friendships request rejected !"
  end

end
