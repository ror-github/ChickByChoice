require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
  	@dress = Dress.new(name: "Floral Print Dress")
  	@dress_size = @dress.dress_sizes.build(size: 1)
  	@reservation = @dress_size.reservations.build(delivery_on: "2016-08-11")
  end

  # Validity of the object
  test "should be valid" do
  	assert @reservation.valid?  	
  end

  # Validation for delivery_on should be present
  test "delivery_on should be present" do
  	@reservation.delivery_on = ""
  	assert_not @reservation.valid?
  end
end
