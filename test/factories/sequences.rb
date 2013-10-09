FactoryGirl.define do
  sequence(:title) { |n| "Title##{n}" }
  sequence(:text) { |n| "#{n}" }

  sequence(:commenter) { |n| "Commenter #{n}" }
  sequence(:body) { |n| "Comment body #{n}" }
end
