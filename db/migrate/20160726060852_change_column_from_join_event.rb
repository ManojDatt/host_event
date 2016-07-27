class ChangeColumnFromJoinEvent < ActiveRecord::Migration[5.0]
  def change
  	rename_column :join_events , :host_id, :guest_id 
  end
end
