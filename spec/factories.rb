FactoryBot.define do
  factory :user do
    name { 'User 1' }
    email { 'user@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
