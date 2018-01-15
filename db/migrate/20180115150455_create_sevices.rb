class CreateSevices < ActiveRecord::Migration
  def change
    create_table :sevices do |t|
      
      t.timestamps null: false
    end
  end
end
