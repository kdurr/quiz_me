require 'spec_helper'

feature 'unauthenticated user signs up', %Q{
  As an unauthenticated user
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
    visit users_path
    click_link 'Sign up'
    user = FactoryGirl.create(:user)
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_on 'Sign up', match: :prefer_exact
    user.save!
    save_and_open_page

    expect(page).to have_content("successfully")
    expect(page).to have_content("Sign Out")
  end

  scenario 'invalid information is supplied' 

  scenario 'the password confirmation fails'
end

