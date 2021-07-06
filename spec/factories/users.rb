FactoryBot.define do
  factory :user do
    nick_name               {Faker::Name.initials}
    email                   {Faker::Internet.free_email}
    password                {"1a"+Faker::Internet.password}
    first_name              {Faker::Name.initials}
    last_name               {Faker::Name.initials}
    first_name_kana         {Faker::Name.initials}
    last_name_kana          {Faker::Name.initials}
    birth_day               {Faker::Date.backward}
  end
end