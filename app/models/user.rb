class User < ApplicationRecord
	validates :name, presence: true

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true,
					  format: { with: EMAIL_REGEX },
					  uniqueness: true
					  
	has_secure_password


	def followers
		Relationship.where(followed_id: id)
	end

	def followed
		Relationship.where(follower_id: id)
	end

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id)
	end
	
end
