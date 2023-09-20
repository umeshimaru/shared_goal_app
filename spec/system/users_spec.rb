require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    @user = FactoryBot.create(:user)
    @monthly_goal = FactoryBot.create(:monthly_goal,user_id: @user.id)
    puts @monthly_goal.inspect
  end

#  describe "ユーザ-登録" do 
#     it "アカウント新規作成と月間目標の登録" do 
#       visit   '/users/sign_in'
#       expect(current_path).to eq new_user_session_path
#       click_on 'アカウント新規登録へ'
#       expect(current_path).to eq new_user_registration_path
#       fill_in 'user-name',                  with: @user.name
#       fill_in 'user_email',                 with: @user.email
#       fill_in 'user_password',              with: @user.password
#       fill_in 'user_password_confirmation', with: @user.password_confirmation
#       expect { click_on '登録' }.to change { User.count }.by(1)
#       visit 'monthly_goals/new'
#       expect(current_path).to eq new_monthly_goal_path
#       fill_in 'Monthly goal', with: @monthly_goal.monthly_goal
#       select '2023', from: 'monthly_goal_goal_achieved_at_1i'
#       select '9'   , from: 'monthly_goal_goal_achieved_at_2i'
#       select '29'  , from: 'monthly_goal_goal_achieved_at_3i'
#       fill_in 'Penalty name', with: @monthly_goal.penalty_name
#       attach_file "monthly_goal[image]","app/assets/images/test.png" 
#       expect {click_button '登録する' }.to change { MonthlyGoal.count }.by(1)
#     end




  # end 

 describe "ログイン関連" do 
  it "ログインすると /monthly_goals/:id/my_goalに遷移する" do 
    visit   '/users/sign_in'
    expect(current_path).to eq new_user_session_path
    fill_in 'user[name]'    ,       with: @user.name
    fill_in 'user[password]',       with: @user.password
    click_button 'Log in'
    visit my_goal_monthly_goal_path(@user)
    expect(current_path).to eq my_goal_monthly_goal_path(@user)
  end

  after do
    DatabaseCleaner.clean
  end
 end


 
  
  end 
