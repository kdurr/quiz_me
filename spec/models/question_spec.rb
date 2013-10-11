require 'spec_helper'

describe Question do

  it { should belong_to :quiz }
  it { should have_many :question_choices }
  it { should have_many :answers }

  it { should validate_presence_of :name }
end
