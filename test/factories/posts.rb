FactoryGirl.define do
  factory :post do
    ignore do
      comments_count 5
      child_comments_count 2
    end

    title
    text

    after(:create) do |post, evaluator|
      FactoryGirl.create_list(:comment, evaluator.comments_count, :post => post)
      post.comments.each do |comment|
        FactoryGirl.create_list(:comment, evaluator.child_comments_count,
          :post => post, :parent => comment)
      end
    end
  end
end
