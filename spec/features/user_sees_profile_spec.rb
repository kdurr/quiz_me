require 'spec_helper'

feature 'have a public profile', %Q{
  As a registered user
  I want to have a public profile
  So that I can share it with my friends and compete
  } do
  #
  # Acceptance Criteria:
  # * Public viewers can view the the quizzes I have created
  # * Public viewers can view my scores on past quizzes
  # * Public viewers can see my avatar

  scenario 'viewers see quizzes I have created' do
    user = FactoryGirl.create(:user, email: "neon@trees.com")
    quiz = FactoryGirl.create(:quiz, user: user)
    visit user_path(user)
    expect(page).to have_content(user.username)
    expect(page).to have_content(quiz.title)
  end

  scenario 'viewers can see my quiz scores'

  scenario 'viewer can see my avatar'
end
