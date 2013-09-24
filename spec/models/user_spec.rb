require 'spec_helper'

describe User do
  it { should have_many :quizzes }
  it { should have_many :submissions }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should have_valid(:first_name).when('Tina', 'Enka') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Durr', 'Takahira') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('kdurr', 'dunkin2013') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('kdurr@abc.com', 'durr13@nsm.com') }
  it { should_not have_valid(:email).when(nil, '', 'dfi34kjdsf') }

  it { should have_valid(:password).when('abc123!', '9876zyxw*') }
  it { should_not have_valid(:password).when(nil, '') }
end
