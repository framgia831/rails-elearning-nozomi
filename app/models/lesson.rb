class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :answers
  has_many :categories
  has_many :words, through: :answers
  has_many :choices, through: :answers
  has_one :activity, :as => :actionable, dependent: :destroy

  def next_word
  	(category.words - words).first
  end

end
