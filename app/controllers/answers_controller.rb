class AnswersController < ApplicationController

	def new
		@category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])
		@words = @category.words.all

		@words_test = @words - @lesson.words
		@words_test_countup = @words.count + 1 - @words_test.count

		if @words_test.count == 0
			redirect_to category_lesson_answers_path
		end

		@word = @words_test.first
	end

	def create
		@category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])
		@answer = Answer.new(
			lesson_id: params[:lesson_id],
			word_id: params[:word_id],
			choice_id: params[:choice_id]
			)
		if @answer.save
			redirect_to new_category_lesson_answer_path
		end
	end

	def index
		@category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])
		@lesson_answers = @lesson.answers.paginate(page: params[:page], per_page: 7)
		@words = @category.words.all
		@correct_answers = Choice.where(judge: true).paginate(page: params[:page], per_page: 7)
		@correct_answers_sum = Choice.where(judge: true)

		@choices = Answer.where(lesson_id: @lesson.id)

		@point = 0
		@correct_answers_sum.zip(@choices).each do |correct_answer_sum, choice|
		
			if correct_answer_sum.id == choice.choice_id
				@point += 1
			end
		end
	end

	private

	def word_params
    	params.require(:word).permit(:content, :category_id, 
    		choices_attributes: [:content, :judge, :id])
 	end

	def answer_params
    	params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
 	end
	
end
