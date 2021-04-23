class CreateCareerTaskLogEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :career_task_log_entries do |t|
      t.text :content
      t.string :entry_type
      t.text :data
      t.integer :task_id
      t.timestamps
    end
  end
end
