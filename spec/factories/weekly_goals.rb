FactoryBot.define do
  factory :weekly_goal do
    weekly_goal { "MyString" }
    start_time { "2023-09-11 17:56:48" }
    user { nil }
    monthly_goal { nil }
  end
end
