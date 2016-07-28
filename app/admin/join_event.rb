ActiveAdmin.register JoinEvent,as:"Guest" do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :host_id,:user_id, :event_id, :status

filter :user_id
filter :event_id
filter :status, as: :select, collection:["pending","accept","reject"]
index do
    selectable_column
    id_column
    column "GUEST NAME",:user_id
    column "HOST USER ID",:host_id
    column "EVENT NAME",:event_id
    column "EVENT JOIN STATUS",:status
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Join Event" do
      f.input :host_id ,prompt:"Select Host" , id:"hosts",as: :select ,collection: User.all ,  :include_blank => false
      f.input :event_id ,prompt:"Select Event",id:"events" ,as: :select
      f.input :user_id ,prompt:"Select Guest", id:"guests" ,as: :select
      f.input :status , prompt:"Select Status", id:"status", as: :select , collection:["pending","accept"]

    end
    f.actions
  end


# controller do
#   def get_events
#    p"-------------------================---------------------#{params[:host_id]}="
#     @host = User.find(params[:host_id])
#     events = @host.events.pluck(:title,:id)

#     render :json => {:events => events}
#   end

#   def get_guests
#      @event = Event.find(params[:event_id])
#     guests = @state.guests.pluck(:name,:id)
#     render :json => {:guests => guests}

#   end
# end


end
