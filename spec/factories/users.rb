FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    age {rand(8..30)}
    plan {[1,2,3].sample}
    rented 0
  end

end
