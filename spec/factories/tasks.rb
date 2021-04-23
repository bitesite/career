FactoryBot.define do
  factory :task, class: 'Career::Task' do
    status { "scheduled" }
    percent_complete { 0.0 }
    description { "My Test Background Job" }
    class_name { "MyTestBackgroundJob" }
    params { [] }
  end
end