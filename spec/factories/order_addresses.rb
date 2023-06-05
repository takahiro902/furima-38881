FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    area_id { 2 }
    city { '新宿区' }
    block {'新宿1-1-1'}
    building_name {'新宿ビル'}
    phone_number {'09012345678'}
  end
end
