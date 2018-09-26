class Admin::UsersController < ApplicationController
	before_action :require_login
	before_action :administrator

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def update
		@user = User.find(params[:id])
		@user.authority = User::ROLE_ADMIN
		@user.save
		redirect_to admin_users_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.authority = nil
		@user.save
		redirect_to admin_users_path
	end

	private
 
    def administrator
		if current_user.authority.nil?
			redirect_to users_path
		end
    end

 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end
