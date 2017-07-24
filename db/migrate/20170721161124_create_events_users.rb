class CreateEventsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_users do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
