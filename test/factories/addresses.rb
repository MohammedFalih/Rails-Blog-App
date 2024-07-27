FactoryBot.define do
  factory :address do
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { 1 }
    country { "MyString" }
    user { nil }
  end
end
