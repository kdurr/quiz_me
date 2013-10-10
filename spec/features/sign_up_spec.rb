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
    visit quizzes_path
    click_on 'Sign Up'

    fill_in "First name", with: "Tina"
    fill_in "Last name", with: "Durr"
    fill_in "Username", with: "tdurr"
    fill_in "Age", with: 10
    fill_in "Email", with: "tdurr@abc.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    
    within(".form-actions") do
    click_on 'Sign up'
    end


    expect(page).to have_content("successfully")
    expect(page).to have_content("Logout")
  end

  scenario 'invalid information is supplied' 

  scenario 'the password confirmation fails'
end
