FactoryGirl.define do
  factory :post do
    ignore do
      comments_count 5
    end

    title
    text

    after(:create) do |post, evaluator|
      FactoryGirl.create_list(:comment, evaluator.comments_count, :post => post)
    end
  end
end
