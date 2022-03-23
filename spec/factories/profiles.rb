FactoryBot.define do
  factory :profile do
    username { "MyString" }
    description { "MyText" }
    phone_number { "MyString" }
    avatar { "MyString" }
    user { nil }
  end
end
