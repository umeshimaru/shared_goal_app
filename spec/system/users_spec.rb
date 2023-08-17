require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

#  describe "user creates an account" do 
#     it "アカウント新規作成したらDBが+1になる" do 
#       visit  users_home_path
#       click_on 'アカウント新規登録へ'

#       fill_in 'user-name',     with: @user.name
#       fill_in 'create-email',  with: @user.email
#       fill_in 'password',      with: @user.password
#       click_on '登録'
#       expect(current_path).to eq "/users"





#     end
  #  end 
  end 
