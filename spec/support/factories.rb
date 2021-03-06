FactoryGirl.define do


  factory :user do
    first_name "John"
    last_name "Smith"
    username "jsmith"
    age 8
    sequence(:email) { |n| "example#{n}@abc.com"}
    password "password"
    password_confirmation "password"
  end

  factory :quiz do
    title 'Awesome Quiz'
    age_rating 6
    user
    id 1
  end

  factory :question do
    name "Where?"
    id 1
    quiz_id 1
  end

  factory :question_choice do
    option "Here"
    correct "true"
    question_id 1
  end
end
