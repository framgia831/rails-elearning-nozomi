class UsersController < ApplicationController
	before_action :require_login, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_url
		else
			render "new"
		end
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 6)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   redirect_to user_path(@user.id)
		else
			render "edit"
		end
	end

	private

  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :department, :image, :remove_image, :biography, :admin)
 	end

 	def require_login
		unless current_user
			flash[:login] ="Plase log in."
			redirect_to root_url
		end
	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end
