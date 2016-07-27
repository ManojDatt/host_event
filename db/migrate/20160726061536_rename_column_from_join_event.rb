class RenameColumnFromJoinEvent < ActiveRecord::Migration[5.0]
  def change
   rename_column :join_events , :guest_id ,:host_id
  end
end
