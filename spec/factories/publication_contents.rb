FactoryBot.define do
  factory :publication_content do
    file { "MyString" }
    description { "MyText" }
    order { 1 }
    type { "" }
    publication { nil }
  end
end
