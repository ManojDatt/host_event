class AddColumnToJoinEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :join_events, :status, :string
  end
end
