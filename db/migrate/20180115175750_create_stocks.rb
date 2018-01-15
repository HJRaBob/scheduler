class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :fortune
      t.string :wise_saying

      t.timestamps null: false
    end
  end
end
