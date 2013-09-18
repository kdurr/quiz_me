require 'spec_helper'

describe QuestionChoice do
  it { should belong_to :question }
  it { should have_one :answer }

  it { should validate_presence_of :option }
end
