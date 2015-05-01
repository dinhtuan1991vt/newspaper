FactoryGirl.define do
  factory :author do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(8)}
  end
end