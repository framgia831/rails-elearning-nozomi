class CategoriesController < ApplicationController

	def index
		@categories = Category.paginate(page: params[:page], per_page: 3)
		@lesson = current_user.lessons
	end

end
