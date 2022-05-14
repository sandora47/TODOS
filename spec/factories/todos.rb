FactoryBot.define do
  factory :todo do
    title { Faker::Book.title }
    body { Faker::String.random }
  end
end
