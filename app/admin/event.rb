ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
filter :user_id
filter :title
filter :date

index do
    selectable_column
    id_column
    column "HOST NAME",:user_id
    column "EVENT NAME",:title
    column  :discription
    column "EVENT DATE",:date 
    column :created_at
    actions
  end


end
