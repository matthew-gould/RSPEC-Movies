FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Movie#{n}" }
    rating {["G", "PG", "PG13", "R"].sample}
    description "Awesome Movie, bro!"
  end

end