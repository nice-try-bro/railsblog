# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:author] do
    ignore do
      posts_count 3
    end

    name
    email
    login
    password

    after(:create) do |user, evaluator|
      FactoryGirl.create_list(:post, evaluator.posts_count, :author => user)
    end
  end
end
