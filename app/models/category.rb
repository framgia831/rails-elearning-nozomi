class Category < ApplicationRecord
	validates :title, presence: true,
					  uniqueness: true
	validates :description, presence: true,
							length: { maximum: 200 }
	default_scope {order(created_at: :desc)}

	has_many :words, dependent: :destroy
end
