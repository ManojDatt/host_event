class CommentsController < ApplicationController

  def new
    p"====comment new ========"
    @comment=Comment.new
  end

  def create
    comment=Event.find(params[:event_id]).comments.build(user_id:current_user.id,content:params[:comment][:content])
     if comment.save
        redirect_to event_path(params[:event_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
