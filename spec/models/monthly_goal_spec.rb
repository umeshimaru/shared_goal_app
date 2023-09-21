require 'rails_helper'

RSpec.describe MonthlyGoal, type: :model do
  before do 
    # @user         = FactoryBot.create(:user)
    @monthly_goal = FactoryBot.build(:monthly_goal)
    
  end

  describe 'monthly_goalカラム' do 
    it 'should be invalid without monthly_goal' do 
        @monthly_goal.monthly_goal = nil
        expect(@monthly_goal).to be_invalid
    end
    
    it 'should be invalid over 101 letters' do
        @monthly_goal.monthly_goal = "a" * 101
        expect(@monthly_goal).to be_invalid
    end
  end 


  describe 'penalty_nameカラム' do 
    it 'should be invalid without penalty_name' do 
      @monthly_goal.penalty_name = nil
      expect(@monthly_goal).to be_invalid
    end
    it 'should be invalid without penalty_name' do 
      @monthly_goal.penalty_name = "a" * 101
      expect(@monthly_goal).to be_invalid
    end
  end 


  
end
