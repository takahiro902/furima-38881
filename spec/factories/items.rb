FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    cost_id {Faker::Number.between(from: 2, to: 3)}
    area_id {Faker::Number.between(from: 2, to: 48)}
    shipment_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user
  end
end
