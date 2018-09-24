class Admin::UsersController < ApplicationController
	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def update
		@user = User.find(params[:id])
		if @user.admin == true
			@user.admin = false
		else
			@user.admin = true
		end
		@user.save
		redirect_to admin_users_path
	end

end
