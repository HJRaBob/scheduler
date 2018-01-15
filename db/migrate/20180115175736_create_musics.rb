class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :stock
      t.string :fortune
      t.string :wise_saying

      t.timestamps null: false
    end
  end
end
