class RelationshipsController < ApplicationController

	def create
	    user = User.find(params[:followed_id])
	    current_user.follow(user)
	    relationships = current_user.active_relationships.find_by(followed: user)
	    relationship = relationships.build_activity(user_id: current_user.id)
	    relationship.save
	    redirect_to user
  	end

  	def destroy
	    user = Relationship.find(params[:id]).followed
	    current_user.unfollow(user)
	    redirect_to user
  	end

  	def index_create
	    user = User.find(params[:followed_id])
	    current_user.follow(user)
	    relationships = current_user.active_relationships.find_by(followed: user)
	    relationship = relationships.build_activity(user_id: current_user.id)
	    relationship.save
	    redirect_to users_path
  	end

  	def index_destroy
	    user = Relationship.find_by(followed_id: params[:id]).followed
	    current_user.unfollow(user)
	    redirect_to users_path
  	end  		

end
