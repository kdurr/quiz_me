class Quiz < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :quizzes
  has_many :submissions,
    inverse_of: :quiz,
    :dependent => :destroy
  has_many :questions,
    inverse_of: :quiz,
    :dependent => :destroy
  accepts_nested_attributes_for :questions,
    :reject_if => lambda { |a| a[:name].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :submissions,
    :reject_if => lambda { |a| a[:name].blank? },
    allow_destroy: true

  validates_presence_of :title
  validates_presence_of :user
  validates_presence_of :age_rating
end
