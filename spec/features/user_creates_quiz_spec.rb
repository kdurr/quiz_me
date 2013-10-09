require 'spec_helper'

feature 'user creates a quiz', %Q{
  As a player
  I want to create a quiz
  so that I can test my friends
} do
#
#   Acceptance Criteria:
#
# * I must provide a title
# * I must provide one or more questions
# * For each question I must provide multiple choice answers
# * I must specify which answer is correct
# * I must mark if it is not an age appropriate quiz
# * I have the option to provide a link for additional information on a question

  scenario 'authenticated user creates quiz' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    sign_in_as user

    visit new_quiz_path
    quiz_name = "Quiz Name"
    fill_in "Title", with: quiz_name
    select 8, from: "Age rating"
    check("Private")
    click_button "Create Quiz"
    expect(page).to have_content("Quiz created successfully")
    expect(Quiz.last.user).to eql(user)
  end

  scenario 'unauthenticated user attempts to create quiz' do
    visit new_quiz_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
