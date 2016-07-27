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
      f.input :host_id , as: :select ,collection: User.all
      f.input :event_id , as: :select , collection: Event.all
      f.input :user_id , as: :select , collection: User.all
      f.input :status ,as: :select , collection:["pending","accept","reject"]
    end
    f.actions
  end

end
