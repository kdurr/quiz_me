require 'spec_helper'

feature 'user searches for a quiz', %Q{
  As a visitor
  I can search for a quiz title
  To gauge what quiz I want to take
} do
  
  scenario 'existing quiz will appear when searched' do
    quiz = FactoryGirl.create(:quiz)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit quizzes_path

    fill_in 'q_title_cont', with: quiz.title
    click_on 'Search'
    expect(page).to have_content(quiz.title)
  end

end
