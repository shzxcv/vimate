FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    password { 'Passw0rd' }
    password_confirmation { 'Passw0rd' }
    role { 'general' }
  end
end
