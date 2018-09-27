class CategoriesController < ApplicationController
	before_action :require_login, only: [:index]

	def index
		@status = params[:status].try(:to_sym)
		@learned = params[:learned]	
		@lessons = current_user.lessons
		@categories_pending = Category.joins("LEFT JOIN words ON categories.id = words.category_id WHERE words.id IS NULL")

		if @status == :learned
			@categories = current_user.categories
		elsif @status == :unlearned
			@categories = Category.where.not(id: current_user.categories.ids)
			@categories = @categories.where.not(id: @categories_pending.ids)
		elsif @status == :pending
			@categories = @categories_pending
		else		
			@categories = Category.all
		end
		@categories = @categories.paginate(page: params[:page], per_page: 6)
	end

	private

 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end
