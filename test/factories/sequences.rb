FactoryGirl.define do
  sequence(:title) { |n| "Title##{n}" }
  sequence(:text) { |n| "#{n}" }

  sequence(:commenter) { |n| "Commenter #{n}" }
  sequence(:body) { |n| "Comment body #{n}" }

  sequence(:name) { |n| "username#{n}" }
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:login) { |n| "login#{n}" }
  sequence(:password) { |n| "passphrase#{n}" }
end
