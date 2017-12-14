FactoryBot.define do
  factory :role do
    name { FFaker::Name.name }
    movie
    actor
  end
end
