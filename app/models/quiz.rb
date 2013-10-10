class Quiz < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :quizzes
  has_many :submissions,
    inverse_of: :quiz
  has_many :questions,
    inverse_of: :quiz,
    :dependent => :destroy
  accepts_nested_attributes_for :questions,
    :reject_if => lambda { |a| a[:name].blank? },
    :allow_destroy => true

  validates_presence_of :title
  validates_presence_of :user
end
