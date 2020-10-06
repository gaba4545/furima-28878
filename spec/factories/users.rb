FactoryBot.define do
  factory :user do
    nickname               {"abe"}
    email                  {"kkk@gmail.com"}
    password               {"abcd0000"}
    password_confirmation  {"abcd0000"}
    surname_zenkaku        {"田中"}
    name_zenkaku           {"角栄"}
    surname_katakana       {"タナカ"}
    name_katakana          {"カクエイ"}
    birthday               {"2045-11-29"}
  end
end