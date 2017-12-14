FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Movie Title #{n}" }
    year 2017
  end
end
