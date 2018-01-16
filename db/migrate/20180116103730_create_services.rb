class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      
      #gridster
      t.integer :order
      t.integer :position_x
      t.integer :position_y
      t.integer :size_x
      t.integer :size_y

      #service
      t.integer :location
      t.string  :music_site
      t.string  :stock_event
      t.integer :fortune_year

      t.timestamps null: false
    end
  end
end
