FactoryGirl.define do
  factory :article do
    name {Faker::Name.name}
    text {Faker::Lorem.word}
  end
end