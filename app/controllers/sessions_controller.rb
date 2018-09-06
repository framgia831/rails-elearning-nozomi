class SessionsController < ApplicationController

	def new
	end

	def create
		user = 	User.find_by(email: params[:session][:email])

		if  user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id

			flash[:success] = "Hurray! Successfully logged in!"
			redirect_to root_url
		else
			flash.now[:notice] = "Invalid information."
		  	render "new"
		end
	end

end
