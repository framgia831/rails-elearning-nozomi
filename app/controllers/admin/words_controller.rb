class Admin::WordsController < ApplicationController
	before_action :require_login, only: [:new, :index, :edit, :update]

	def new
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.build
		4.times {
      	@word.choices.build
    	}
	end

	def create
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.build(word_params)

		if @word.save
			flash[:success] = "Word successfully added."
			redirect_to admin_categories_path
		else
			render "new"
		end
	end

	def index
		@category = Category.find_by(id: params[:category_id])
		@words = @category.words.all.paginate(page: params[:page], per_page: 8)
		if @words.empty?
			flash[:success] = "Firstly, please add words of this category."
			redirect_to admin_categories_path
		end
	end

	def edit
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.find(params[:id])
	end

	def update
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.find(params[:id])
		if @word.update(word_params)
		   flash[:success] = "Word successfully updated."
		   redirect_to admin_categories_path
		else
			render "edit"
		end
	end

	def destroy
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.find(params[:id])
		@word.destroy
		flash[:success] = "Word successfully deleted."
		redirect_to admin_category_words_path(category_id: @category.id)
	end

	private

	def word_params
    	params.require(:word).permit(:content, :category_id, 
    		choices_attributes: [:content, :judge, :id])
 	end
	
 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end