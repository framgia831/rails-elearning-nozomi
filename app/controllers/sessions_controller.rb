class SessionsController < ApplicationController

	def new
	end

	def create
		user = 	User.find_by(email: params[:session][:email])
 		if  user && user.authenticate(params[:session][:password])
			log_in user

			if user.admin?
				redirect_to admin_categories_path
			else
				redirect_to user_path(user.id)
			end
		else
		  	flash[:login] = "Invalid information."
		  	redirect_to root_url
		end
	end

	def destroy
		session.destroy
		flash[:notice] = "Logged out."
		redirect_to root_url
	end
end
