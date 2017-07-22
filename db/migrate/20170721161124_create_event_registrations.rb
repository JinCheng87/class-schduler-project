class CreateEventRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :event_registrations do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
