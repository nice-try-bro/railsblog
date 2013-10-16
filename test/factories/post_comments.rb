FactoryGirl.define do
  factory 'post/comment' do
    post

    commenter
    body
  end
end
