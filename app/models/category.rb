class Category < ApplicationRecord
	validates :title, presence: true,
					  uniqueness: true
	validates :description, presence: true,
							length: { maximum: 200 }
end
