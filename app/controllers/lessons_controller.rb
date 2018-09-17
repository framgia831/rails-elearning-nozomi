class LessonsController < ApplicationController

	def create
		@category = Category.find(params[:category_id])
		@lesson = current_user.lessons.create(category: @category)

		if @lesson.save
		redirect_to new_category_lesson_answer_path(lesson_id: @lesson.id)
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
	
end
