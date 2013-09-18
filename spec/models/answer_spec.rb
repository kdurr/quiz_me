require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should belong_to :submission }
  it { should belong_to :question_choice }
end
