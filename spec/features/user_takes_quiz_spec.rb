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
  let(:user) { FactoryGirl.create(:user, email: "hello@bye.com") }
  let(:user1) { FactoryGirl.create(:user, email: "bye@hello.com") }
  let(:quiz) { FactoryGirl.create(:quiz, user: user) }

  scenario 'can select a quiz' do
    user
    user1 
    sign_in_as(user1)

    quiz
    visit quizzes_path
    click_on 'Take this Quiz!'

    expect(page).to have_content("Take Quiz")
  end

  scenario 'can submit quiz with options selected' do
    prev_count = Submission.count
    user
    user1 
    quiz
    FactoryGirl.create(:question)
    FactoryGirl.create(:question_choice)
    sign_in_as(user1)

    visit quiz_path(quiz)  
    choose 'Here'
    click_on 'Submit'

    expect(Submission.count).to eql(prev_count + 1)
  end
end
