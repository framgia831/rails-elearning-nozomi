class Admin::ChoicesController < ApplicationController

	def new
		@choice = Choice.new
	end


# 	def create_multi
# 	 	0.upto(3) do |i|
#     	Choice.create!(params[:choices][i.to_s])
#   	end
# end

end
