FactoryBot.define do
  factory :actor do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    birth_date { (15.years + rand(50.years)).ago }
  end
end
