FactoryBot.define do
  factory :user_lesson do
    time { '100' }
    answer_rate { '60' }
    point { '3' }

    trait :answer_rate do
      sequence(:answer_rate) { |n| n * 3 + 50}
    end

    trait :all_user_answer_rate do
      sequence(:answer_rate) { |n| n * 3 + 50}
    end

    trait :time do
      sequence(:time) { |n| n * 3 + 30}
    end

    trait :all_user_time do
      sequence(:time) { |n| n * 3 + 30}
    end

    trait :today_answer do
      sequence(:answer_rate) { |n| n * 3 + 50}
    end

    trait :yesterday_answer do
      sequence(:answer_rate) { |n| n * 2 + 50}
      created_at { Time.current.ago(1.days) }
    end

    trait :two_days_ago_answer do
      sequence(:answer_rate) { |n| n * 1 + 50}
      created_at { Time.current.ago(2.days) }
    end

    trait :today_time do
      sequence(:time) { |n| n * 3 + 30}
    end

    trait :yesterday_time do
      sequence(:time) { |n| n * 2 + 30}
      created_at { Time.current.ago(1.days) }
    end

    trait :two_days_ago_time do
      sequence(:time) { |n| n * 1 + 30}
      created_at { Time.current.ago(2.days) }
    end
  end
end
