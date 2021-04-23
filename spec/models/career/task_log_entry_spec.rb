require 'rails_helper'

module Career
  describe TaskLogEntry, type: :model do
    it 'is valid with default factory data' do
      expect(build(:task_log_entry)).to be_valid
    end
    
    it 'is invalid without content' do
      expect(build(:task_log_entry, content: nil)).to be_invalid
    end

    it 'is invalid without a entry_type content' do
      expect(build(:task_log_entry, entry_type: nil)).to be_invalid
    end
  end
end