class Word < ApplicationRecord
	belongs_to :category, optional: true
	has_many :choices, dependent: :destroy
	
	accepts_nested_attributes_for :choices

 	validates :content, presence: true,
					  uniqueness: true,
					  length: { maximum: 20 }
					  
end
