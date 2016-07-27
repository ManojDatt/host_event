ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :dob, :email, :password, :address
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :name
filter :email
filter :address
filter :created_at
index do
    selectable_column
    id_column
    column "HOST NAME",:name
    column "DATE OF BIRTH",:dob
    column "EMAIL",:email
    column "ADDRESS",:address
    column :created_at
    actions
  end
  form do |f|
    f.inputs "Join Event" do
      f.input :name 
      f.input :dob 
      f.input :email 
      f.input :password 
      f.input :address
    end
    f.actions
  end

end
