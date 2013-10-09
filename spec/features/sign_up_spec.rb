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
    user = FactoryGirl.create(:user)
    within(".form-actions") do
      click_on 'Sign up'
    end
    user.save!

    expect(page).to have_content("successfully")
    expect(page).to have_content("Sign Out")
  end

  scenario 'invalid information is supplied' 

  scenario 'the password confirmation fails'
end
