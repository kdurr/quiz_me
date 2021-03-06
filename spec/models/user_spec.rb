require 'spec_helper'

describe User do
  it { should have_many :quizzes }
  it { should have_many :submissions }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_numericality_of :age }

  it { should have_valid(:first_name).when('Tina', 'Enka') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Durr', 'Takahira') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('kdurr', 'dunkin2013') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('kdurr@abc.com', 'durr13@nsm.com') }
  it { should_not have_valid(:email).when(nil, '', 'dfi34kjdsf') }

  it { should have_valid(:age).when(12, 21) }
  it { should_not have_valid(:age).when(nil, '', 'dfi34kjdsf') }
end
