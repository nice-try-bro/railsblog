FactoryGirl.define do
    sequence(:title) { |n| "Title##{n}" }
    sequence(:text) { |n| "#{n}" }
end

FactoryGirl.define do
  factory :post do
    title
    text
  end
end
