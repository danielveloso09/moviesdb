FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "#{FFaker::Movie.title}-#{n}" }
    year { rand(1910..(Date.today.year)) }
  end
end
