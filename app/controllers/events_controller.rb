class EventsController < ApplicationController
	before_action :authenticate_user! 
	before_action :self_find , only:[:show, :edit,:destroy_event,:update_event,:edit,:update]
  def index
  	@users = User.all.where("id !=?",current_user.id).page(params[:page]).per(5)
  	@even_last=current_user.events.last
    @events=current_user.events.where("id != ?",@even_last.id).order('DESC') if @even_last
  end
   #######################   PUBLISH EVENT CREATED #######################
  def publish_event
  ActionCable.server.broadcast 'publish_channel',
        event_title: current_user.events.last.title,
        event_disc: current_user.events.last.discription,
        user: current_user.name

        redirect_to root_path , notice:"Event published !"
  end
  def new
  	@event=Event.new
  end

  def create
  	event=current_user.events.build(params_list)
      	if event.save
      		redirect_to root_path , notice:"Event generated successfully !"
      	else
      		head :ok
      	end
  end

  def like_event
    current_user.likes.create(event_id:params[:event_id])
    redirect_to event_path(params[:event_id]) ,notice:"You liked this event !"
  end

  def show
    
  end
  def edit
    
  end
  def update
    @event.update(params_list)
    redirect_to root_path, notice:"Event updated successfully !"
  end
  def update_event
    render 'edit'
  end
  
  def destroy_event
  	@event.destroy
    redirect_to root_path, notice:"Event deleted successfully !"
  end

  def request_join_event
   event=Event.find(params[:event_id])
   restset= event.join_events.build(user_id:current_user.id,host_id:params[:host_id],status:"pending")
    if restset.save
      redirect_to root_path, notice:"Event join request send !"
    end
  end

  def accept_event_join_request
   event=Event.find(params[:event_id])
   event.join_events.where(user_id:params[:guest_id],host_id:current_user.id).update(status:"accept")
   redirect_to root_path, notice:"Event join request accepted !"
  end

  def reject_event_join_request
   event=Event.find(params[:event_id])
   event.join_events.where(user_id:params[:guest_id],host_id:current_user.id,status:"pending").first.destroy
   redirect_to root_path, notice:"Event join request rejected !"
  end
  
  private
  def self_find
  	@event = Event.find(params[:id])
  end
  def params_list
  	 params.require(:event).permit(:title,:discription,:date)
  end
end
