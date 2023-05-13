FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    last_name_kana { japanese_user.last.katakana }
    first_name_kana { japanese_user.first.katakana }
    birthday { Faker::Date.birthday(min_age: 5, max_age: 100) }
  end
end
