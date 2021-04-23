require 'rails_helper'

module Career
  describe Task, type: :model do
    it 'is valid with default factory data' do
      expect(build(:task)).to be_valid
    end
    
    it 'is invalid without a description' do
      expect(build(:task, description: nil)).to be_invalid
    end
  
    it 'is invalid without a class_name' do
      expect(build(:task, class_name: nil)).to be_invalid
    end
  
    it 'is invalid without a status' do
      expect(build(:task, status: nil)).to be_invalid
    end
  
    it 'is invalid without a percent_complete' do
      expect(build(:task, percent_complete: nil)).to be_invalid
    end
  end
end
