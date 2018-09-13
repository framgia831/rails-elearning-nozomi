class Word < ApplicationRecord
	belongs_to :category, optional: true
	has_many :choices, dependent: :destroy
	
	accepts_nested_attributes_for :choices

 	validates :content, presence: true,
					  uniqueness: true,
					  length: { maximum: 20 }


   validate :one_correct

   private

   	def one_correct
   		judge = choices.collect {|item|item.judge || nil }.compact.count 
   		unless judge == 1
   		errors.add(:choices, ": should have one correct answer")
   		end
    end				  
end
