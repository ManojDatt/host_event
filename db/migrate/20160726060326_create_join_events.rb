class CreateJoinEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :join_events do |t|
      t.references :user, foreign_key: true
      t.integer :host_id
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
