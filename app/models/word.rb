class Word < ApplicationRecord
	belongs_to :category, optional: true
	has_many :choices, dependent: :destroy
	
	accepts_nested_attributes_for :choices

 	validates :content, presence: true,
					  uniqueness: true,
					  length: { maximum: 20 }


   	validate :one_correct

   	private

   	# def one_correct

   	# 	if :judge == true
   	# 	error.add(:choices, "Shoud have one correct answer")  
   	# 	end		
   	# end


   	def one_correct
   		judge_sum = Choice.pluck(:judge)
   		judge_sum.sum
   		unless judge_sum == 1
   		errors.add(:choices, "should have one correct answer")
   		end
    end
					  
end
