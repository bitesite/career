class CreateCareerTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :career_tasks do |t|
      t.string :status
      t.float :percent_complete
      t.string :description
      t.string :class_name
      t.datetime :started_at
      t.datetime :completed_at
      t.integer :user_id
      t.text :params
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
