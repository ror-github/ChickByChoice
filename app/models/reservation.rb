class Reservation < ActiveRecord::Base
	include ApplicationHelper

	# Callbacks
	after_create :set_return_on_date

	# Associations
  belongs_to :dress_size

  # Validations
  validates :delivery_on, presence: true

  private
  # Sets return date for reservation. If it's weekend the it changes to next business day (Assumption)
  def set_return_on_date
  	return_on_date = self.delivery_on + 3.days
  	return_on_date = change_if_weekend_date(return_on_date)
  	self.update_attributes(return_on: return_on_date)
  end
end
