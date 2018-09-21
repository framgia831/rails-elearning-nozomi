class AnswersController < ApplicationController
	before_action :require_login, only: [:new, :create, :index]

	def new
		@category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])
		@words = @category.words
		@word = @lesson.next_word

		@progress = @lesson.answers.count + 1

		if @word.nil?
			redirect_to category_lesson_answers_path
		end
	end

	def create
		@category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])

		@answer = @lesson.answers.build(
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
		@points = @lesson.choices.where(judge: true).size

		@lesson_answers = @lesson.answers.paginate(page: params[:page], per_page: 10)
	endd
	
 	def require_login
		unless current_user
			flash[:login] ="You need to login to view this content. Please Login."
			redirect_to root_url
		end
	end

end
