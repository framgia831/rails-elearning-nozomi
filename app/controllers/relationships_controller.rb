class RelationshipsController < ApplicationController
	# def create
	# 	Relationship.create(
	# 		follower_id: current_user.id,
	# 		followed_id: params[:followed_id]
	# 		)

	# 	redirect_to user_url(params[:followed_id])
	# end

	# def destroy
	# 	relationship = Relationship.find(params[:id])
	# 	relationship.destroy

	# 	redirect_to user_url(relationship.followed_id)
	# end


	def create
	    user = User.find(params[:followed_id])
	    current_user.follow(user)
	    redirect_to user
  	end

  	def destroy
	    user = Relationship.find(params[:id]).followed
	    current_user.unfollow(user)
	    redirect_to user
  	end

end
