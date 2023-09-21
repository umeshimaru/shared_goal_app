FactoryBot.define do
  factory :monthly_goal do
    monthly_goal { "ドラゴンボール７個集める" }
    goal_achieved_at { "2023-08-23" }
    penalty_name { "MyString" }
    image { "MyString" }
    user_id { association :user } 
  end
end
