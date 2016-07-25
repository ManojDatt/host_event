class EventsController < ApplicationController
	before_action :authenticate_user! 
	before_action :self_find , only:[:show, :edit,:destroy]
  def index
  	@users = User.all.where("id !=?",current_user.id).paginate(:page => params[:page],per_page:5)
  	@even_last=current_user.events.last
    @events=current_user.events.where("id != ?",@even_last.id).order('DESC') if @even_last
  end

  def new
  	@event=Event.new
  end

  def create
    debugger
  	event=current_user.events.build(params_list)
  	if event.save
  		redirect_to root_path , notice:"Event generated successfully !"
  	else
  		head :ok
  	end

  end

  def show
  end

  
  def destroy
  	
  end

  
  private
  def self_find
  	@event = Event.find(params[:id])
  end
  def params_list
  	 params.require(:event).permit(:title,:discription,:date)
  end
end
