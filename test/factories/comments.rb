FactoryGirl.define do
  factory :comment do
    post

    commenter
    body
  end
end
