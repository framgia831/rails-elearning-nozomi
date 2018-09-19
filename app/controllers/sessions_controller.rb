class SessionsController < ApplicationController
	before_action :require_login, only: [:show, :index]

	def new
	end

	def create
		user = 	User.find_by(email: params[:session][:email])
 		if  user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to dashboard_path
		else
		  	flash[:login] = "Invalid information."
		  	redirect_to root_url
		end
	end

	def show
		ids = current_user.following.ids
		ids << current_user.id

		@activity = Activity.where(user_id: ids)
	end

	def index
		@activity = Activity.where(user_id: current_user.id)
		@lessons = Lesson.where(user_id: current_user.id)

		@ids = [nil]
		@lessons.each do |lesson|
			@ids << lesson.word_ids
		end

		if @ids == [nil]
			render "show"
		else
		@ids.flatten!.compact!
		@words = Word.where(id: @ids).paginate(page: params[:page], per_page: 8)
		end
	end

	def destroy
		session.destroy
		flash[:notice] = "Logged out."
		redirect_to root_url
	end

 	def require_login
		unless current_user
			flash[:login] ="Plase log in."
			redirect_to root_url
		end
	end
end
