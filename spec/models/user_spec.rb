require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'nameカラム' do 
    it 'is invalid without a name' do 
     @user.name = nil
     expect(@user).to be_invalid
    end   

    it 'should be unique in name' do 
      @user.save
      user = FactoryBot.build(:user, name: '梅田')
      expect(user).to be_invalid
    end
  end 
end
