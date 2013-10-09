FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Smith"
    username "jsmith"
    age 8
    email "example@abc.com"
    password "password"
    password_confirmation "password"
  end
end
