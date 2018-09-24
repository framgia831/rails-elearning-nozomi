class Admin::CategoriesController < ApplicationController
	before_action :require_login, only: [:new, :index, :show, :edit]
	before_action :administrator

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:success] = "Category successfully created."
			redirect_to admin_categories_path
		else
			render "new"
		end
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:success] = "Category successfully edited."
		   redirect_to admin_categories_path
		else
			render "edit"
		end
	end

	def destroy
	@category = Category.find(params[:id])
	@category.destroy
	flash[:success] = "Category successfully deleted."
	redirect_to admin_categories_path
	end

	private

	def category_params
    	params.require(:category).permit(:title, :description, :difficulty)
 	end
 
    def administrator
		unless current_user.admin?
			redirect_to root_url
		end
    end

 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end