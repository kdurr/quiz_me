require 'spec_helper'

describe Quiz do

  it { should belong_to :user }
  it { should have_many :submissions }
  it { should have_many :questions }

  it { should validate_presence_of :title }

end
