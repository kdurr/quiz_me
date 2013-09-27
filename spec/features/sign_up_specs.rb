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
    click_link 'Sign Up'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Username', with: 'jsmith'
    fill_in 'Age', with: 12
    fill_in 'Email', with: 'jsmith@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Sign Me Up!'

    expect(page).to have_content("You are now signed up!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'invalid information is supplied' do
  end

  scenario 'the password confirmation fails' do
  end  
end

