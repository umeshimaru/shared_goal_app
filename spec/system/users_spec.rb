require 'rails_helper'

RSpec.describe "Users", type: :system do

 describe "user creates an account" do 
    it "アカウント新規作成したらDBが+1になる" do 
      visit  users_home_path
      click_on 'アカウント新規登録へ'

      fill_in 'recipient-name',     with: 'まさなかにき'
      fill_in 'recipient-email',    with: 'amgajdjkd@yahoo.co.jp'
      fill_in 'recipient-password', with: 'box1234'
      click_on '登録'


    end
   end 
  end 
