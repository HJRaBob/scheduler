class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :nx
      t.integer :ny
      t.timestamps null: false
    end
  end
end
