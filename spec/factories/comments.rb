FactoryBot.define do
  factory :comment do
    username { FactoryBot.create(:user) }
    body { Faker::Lorem.paragraph }
    todo { (FactoryBot.create(:todo)) }
  end
end
