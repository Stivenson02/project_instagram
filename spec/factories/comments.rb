FactoryBot.define do
  factory :comment do
    description { "MyText" }
    user { nil }
    publication { nil }
  end
end
