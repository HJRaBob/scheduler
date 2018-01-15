class CreateWiseSayings < ActiveRecord::Migration
  def change
    create_table :wise_sayings do |t|

      t.timestamps null: false
    end
  end
end
