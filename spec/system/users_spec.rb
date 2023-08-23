require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

 describe "user creates an account" do 
    it "アカウント新規作成したらユーザーテーブルのレコードが＋１する" do 
      visit   '/users/sign_in'
      click_on 'アカウント新規登録へ'
      fill_in 'user-name',                  with: @user.name
      fill_in 'user_email',                 with: @user.email
      fill_in 'user_password',              with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
    
      expect { click_on '登録' }.to change { User.count }.by(1)
    end
  end 




 
  
  end 
