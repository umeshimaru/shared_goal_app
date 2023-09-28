FactoryBot.define do
  factory :task do
    task { "MyString" }
    start_time { "2023-09-28 23:53:03" }
    end_time { "2023-09-28 23:53:03" }
    weekly_goal { nil }
  end
end
