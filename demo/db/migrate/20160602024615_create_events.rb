class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_pu_blic
      t.integer :capacity
      t.string :foobar

      t.timestamps null: false
    end
  end
end
