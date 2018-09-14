class LessonsController < ApplicationController

	def index
		number = 1
		@category = Category.find_by(id: params[:category_id])
		# @words = @category.words.all.paginate(page: params[:page], per_page: 1)
		@words = @category.words.all.page(params[:page]).per(1).order(:id)
	end

	def update

	end

	private

	def word_params
    	params.require(:word).permit(:content, :word_id, 
    		choices_attributes: [:content, :judge, :id])
 	end
	
end
