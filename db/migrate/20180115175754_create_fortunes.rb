class CreateFortunes < ActiveRecord::Migration
  def change
    create_table :fortunes do |t|
      t.string :wise_saying

      t.timestamps null: false
    end
  end
end
