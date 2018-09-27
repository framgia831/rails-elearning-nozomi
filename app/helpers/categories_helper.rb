module CategoriesHelper

	def status_active(current, status)
		"active" if current == status
	end
end
