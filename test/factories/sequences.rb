FactoryGirl.define do
  sequence(:title) { |n| "Title##{n}" }
  sequence(:text) { |n| "#{n}" }
end
