class Admin::UsersController < ApplicationController
	before_action :require_login
	before_action :administrator

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def update
		@user = User.find(params[:id])
		if @user.admin?
			@user.admin = false
		else
			@user.admin = true
		end
		@user.save
		redirect_to admin_users_path
	end

	private
 
    def administrator
		unless current_user.admin?
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
