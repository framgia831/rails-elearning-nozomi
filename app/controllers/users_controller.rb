class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(
			name: params[:user][:name],
			email: params[:user][:email],
			password: params[:user][:password],
			password_confirmation: params[:user][:password_confirmation],
			department: params[:user][:department],
			admin: params[:user][:admin]
			)

		if @user.save
			redirect_to root_url
		else
			render "new"
		end
	end
end
