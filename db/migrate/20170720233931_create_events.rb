class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.integer :max_participants
      t.belongs_to :sutdio
      t.timestamps
    end
  end
end
