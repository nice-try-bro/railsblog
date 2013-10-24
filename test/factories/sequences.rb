FactoryGirl.define do
  sequence(:title) { |n| "Title##{n}" }
  sequence(:text) { |n| "#{n}" }

  sequence(:commenter) { |n| "Commenter #{n}" }
  sequence(:body) { |n| "Comment body #{n}" }
  sequence(:state) do |n|
    states_array = Post.state_machine.states.to_a
    states_array[n % states_array.count].name
  end
  sequence(:name) { |n| "username#{n}" }
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:login) { |n| "login#{n}" }
  sequence(:password) { |n| "passphrase#{n}" }
end
