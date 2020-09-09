FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    surname_zenkaku       {"AA"}
    name_zenkaku          {"II"}
    surname_katakana      {"aa"}
    name_katakana         {"ii"}
    birthday              {"00/00"}
  end
end