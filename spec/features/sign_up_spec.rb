require 'spec_helper'

feature 'unregistered user signs up', %Q{
  As an unregistered user
  I want to be able to register
  So that I can create a profile
} do
  #
  # Acceptance Criteria:
  #
  # * I must provide my first name
  # * I can provide my last name
  # * I can create a username
  # * I must provide an email address
  # * I must create and confirm a password
  # * I must provide my age

  scenario 'providing valid required information' do
    prev_count = User.count
    visit quizzes_path
    click_on 'Sign Up'

    fill_in "First name", with: "Tina"
    fill_in "Last name", with: "Durr"
    fill_in "Username", with: "tdurr"
    select 10, from: "Age"
    fill_in "Email", with: "tdurr@abc.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    
    within(".form-actions") do
    click_on 'Sign up'
    end

    expect(page).to have_content("successfully")
    expect(page).to have_content("Logout")
    expect(User.count).to eql(prev_count + 1)
  end

  scenario 'invalid information is supplied' do
    prev_count = User.count
    visit quizzes_path
    click_on 'Sign Up'

    within(".form-actions") do
      click_on 'Sign up'
    end

    expect(page).to have_content("can't be blank")
    expect(User.count).to eql(prev_count)
  end 
end
