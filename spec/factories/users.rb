FactoryBot.define do
  factory :user do
    nick_name               {"やまだ"}
    email                   {Faker::Internet.free_email}
    password                {"aaa111"}
    password_confirmation   {password}
    first_name              {"山田"}
    last_name               {"太郎"}
    first_name_kana         {"ヤマダ"}
    last_name_kana          {"タロウ"}
    birth_day               {"1930-01-01"}
  end
end