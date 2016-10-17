module ReservationsHelper

	# Validates if resrvation can be made on selected date
	def can_make_reservation?(dress_size, date)
		reservations = Reservation.where("dress_size_id = ?", dress_size.id)
		can_make_reservation = true
		reservations.each do |reservation|
			if date >= reservation.delivery_on and date <= reservation.return_on + 1.day
				can_make_reservation = false
				break
			end
		end
		return can_make_reservation
	end

	# Checks available dates for reservation
	def check_available_dates(dress_size, month, year)
		dates = []
		start_date = Date.parse("#{year}-#{month}-1")
		end_date = start_date.end_of_month
		for date in start_date..end_date
			if can_make_reservation?(dress_size, date) and !date.saturday? and !date.sunday?
				dates << date
			end
		end
		return dates
	end
end
