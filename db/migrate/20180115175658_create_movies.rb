class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :music
      t.string :stock
      t.string :fortune
      t.string :wise_saying

      t.timestamps null: false
    end
  end
end
