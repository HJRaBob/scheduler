class CreateTaskSchedulers < ActiveRecord::Migration
  def change
    create_table :task_schedulers do |t|

      t.timestamps null: false
    end
  end
end
