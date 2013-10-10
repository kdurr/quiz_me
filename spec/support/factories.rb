FactoryGirl.define do
  factory :user do |u|
    first_name "John"
    last_name "Smith"
    username "jsmith"
    age 8
    u.sequence(:email) { |n| "example#{n}@abc.com" }
    password "password"
    password_confirmation "password"
  end

  factory :quiz do
    title 'Awesome Quiz'
    user

    factory :question do
      name "Where?"
    end

    factory :question_choice do
      option "Here"
      correct "1"
    end
  end
end
