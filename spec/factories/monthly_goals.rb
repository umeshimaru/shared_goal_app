FactoryBot.define do
  factory :monthly_goal do
    monthly_goal { "MyString" }
    goal_achieved_at { "2023-08-23" }
    penalty_name { "MyString" }
    image { "MyString" }
    user { nil }
  end
end