module Career
  class TaskLogEntry < ApplicationRecord
    belongs_to :task
  
    validates :content, :entry_type, presence: true
  
    scope :chronological, -> { order(created_at: :asc) }
  end
end


