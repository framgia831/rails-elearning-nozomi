class SessionsController < ApplicationController

	def new
	end

	def create
		user = 	User.find_by(email: params[:session][:email])
 		if  user && user.authenticate(params[:session][:password])
			log_in user

			flash[:success] = "Hurray! Successfully logged in!"
			redirect_to user_path(user.id)
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
