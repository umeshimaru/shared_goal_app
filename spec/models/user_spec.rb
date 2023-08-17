require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'nameカラム' do 
    it 'should be invalid without a name' do 
      @user.name = nil
      expect(@user).to be_invalid
    end   
    it 'should be unique in name' do 
      @user.save
      user = FactoryBot.build(:user, name: '梅田')
      expect(user).to be_invalid
    end
  end 

  describe 'emailカラム' do 
    it 'should be invalid without email' do 
      @user.email = nil 
      expect(@user).to be_invalid
    end
    it 'should be unique email' do 
      @user.save
      user = FactoryBot.build(:user, email: "amagkd@yahoo.co.jp")
      expect(user).to be_invalid
    end
  end

end 
