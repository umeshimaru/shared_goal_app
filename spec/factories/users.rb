FactoryBot.define do
  factory :user do
    name                                { "梅田" }
    email                               { "tester@example.com" }
    password                            {  "password" }
    password_confirmation               {  "password" }
  end
  
end



