module Career
  class Task < ApplicationRecord
    has_many :task_log_entries, dependent: :destroy
    belongs_to :user, optional: true
    
    VALID_STATUSES = ['scheduled', 'started', 'complete', 'failed', 'interrupted', 'canceled']
    
    serialize :params, Array
    
    validates :description, :class_name, :percent_complete, presence: true
    validates :status, presence: true, inclusion: { in: VALID_STATUSES, message: "%{value} is not a valid status" }

    scope :reverse_chronological, -> { order(created_at: :desc) }

    VALID_STATUSES.each do |method_name|
      define_method "#{method_name}?" do
        status == method_name
      end
    end

    def enqueue
      Resque.enqueue(class_name.constantize, id, *params)
    end

    def enqueue_at(scheduled_date)
      Resque.enqueue_at(scheduled_date, class_name.constantize, id, *params)
    end

    def log_task_log_entry(content, entry_type='info', data=nil)
      task_log_entry = task_log_entries.create(content: content, entry_type: entry_type, data: data)    
      
      # TODO: Implement
      #TaskLogEntriesChannel.broadcast_to(self, task_log_entry)
    end

    def set_status(status)
      updated_attributes = { status: status }
      
      if status == 'started'
        updated_attributes[:percent_complete] = 0
        updated_attributes[:started_at] = Time.now
      end

      if status == 'complete'
        updated_attributes[:percent_complete] = 100
        updated_attributes[:completed_at] = Time.now
      end

      self.update(updated_attributes)

      # TODO: Implement
      #TasksChannel.broadcast_to(self, self)
    end

    def update_percent_complete(percent_complete)
      self.update(percent_complete: percent_complete)
      
      # TODO: Implement
      #TasksChannel.broadcast_to(self, self)
    end
  end
end
