class CategoriesController < ApplicationController
	before_action :require_login, only: [:index]

	def index

		@categories = Category.all

		@ready = [nil]
		@learned_lesson = [nil]
		@learn_lesson = [nil]

		@categories.each do |category|
			if category.words.empty?
				@ready << category
			elsif current_user.lessons.pluck(:category_id).any?(category.id)
				@learned_lesson << category
			else
				@learn_lesson << category
			end
		end

		if params[:learned] == 1
			@learned = 1				
			@categories = @ready.compact
			redirect_to categories_path(learned: 1)
		elsif params[:learned] == 2
			@learned = 2
			@categories = @learned_lesson.compact
			redirect_to categories_path(learned: 2)
		elsif params[:learned] == 3
			@learned = 3			
			@categories = @learn_lesson.compact
			redirect_to categories_path(learned: 3)
		end
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
