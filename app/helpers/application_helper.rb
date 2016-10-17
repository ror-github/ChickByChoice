module ApplicationHelper

	# If weekend date then it changes it to next Business Day
	def change_if_weekend_date(requested_date)
		changed_date = (requested_date.saturday?) ? requested_date + 2.day : (requested_date.sunday?) ? requested_date + 1.day : requested_date
		return changed_date
	end
end
