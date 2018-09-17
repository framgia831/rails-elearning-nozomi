class Choice < ApplicationRecord
	belongs_to :word, optional: true
	has_many :answers

   	validates :content, presence: true,
					  length: { maximum: 20 }

	validates :judge, inclusion: {in: [true, false]}
   	
end
