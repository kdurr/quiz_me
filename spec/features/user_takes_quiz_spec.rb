require 'spec_helper'

feature 'nerd can take a quiz', %Q{
  As a authenticated trivia nerd
  I can take a quiz
  So that I can reaffirm my genius
  } do
  #
  # Acceptance Criteria
  #
  # * I can take a quiz by selecting answers
  # * I can see my score once submitted
  # * I can view which questions I answered incorrectly
  
  scenario 'can select a quiz' do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    sign_in_as(user1)

    quiz = FactoryGirl.create(:quiz)
    visit quizzes_path
    click_on 'Take this Quiz!'

    expect(page).to have_content("Take Quiz")
  end

  scenario 'can submit quiz with options selected' do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    sign_in_as(user1)
    quiz = FactoryGirl.create(:quiz)

    visit quiz_path(quiz)  
    binding.pry
    click_on 'Here'
    click_on 'Create Submission'

    expect(@submission.result.count).to eql(4)
  end


end
