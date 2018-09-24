class CategoriesController < ApplicationController
	before_action :require_login, only: [:index]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 6)
		@lesson = current_user.lessons
	end

	private

 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end
