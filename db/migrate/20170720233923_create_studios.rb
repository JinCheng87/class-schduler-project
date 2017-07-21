class CreateStudios < ActiveRecord::Migration[5.0]
  def change
    create_table :studios do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.text :address, null: false
      t.belongs_to :user,null: false
      t.timestamps
    end
  end
end
