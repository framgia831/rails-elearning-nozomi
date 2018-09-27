class CategoriesController < ApplicationController
	before_action :require_login, only: [:index]

	def index
		@status = params[:status].try(:to_sym)
		@learned = params[:learned]
		@categories = Category.all.paginate(page: params[:page], per_page: 6)
		@lesson = current_user.lessons

		if @status == :learned
			@categories = current_user.categories.paginate(page: params[:page], per_page: 6)
		elsif @status == :unlearned
			@categories = Category.where.not(id: current_user.categories.ids).paginate(page: params[:page], per_page: 6)
		elsif @status == :pending
			@categories = Category.joins("LEFT JOIN words ON categories.id = words.category_id WHERE words.id IS NULL").paginate(page: params[:page], per_page: 6)
		end
	end

	private

 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end
