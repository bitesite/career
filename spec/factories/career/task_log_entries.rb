FactoryBot.define do
  factory :task_log_entry, class: 'Career::TaskLogEntry' do
    content { "MyText" }
    entry_type { "success" }
    task
  end
end
