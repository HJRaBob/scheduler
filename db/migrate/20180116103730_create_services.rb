class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      
      #gridster
      t.integer :sequence
      t.integer :position_x
      t.integer :position_y
      t.integer :size_x
      t.integer :size_y

      t.timestamps null: false
    end
  end
end
