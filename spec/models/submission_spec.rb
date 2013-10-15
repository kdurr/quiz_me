require 'spec_helper'

describe Submission do
  it { should belong_to :user }
  it { should belong_to :quiz }
  it { should have_many :answers }
end
