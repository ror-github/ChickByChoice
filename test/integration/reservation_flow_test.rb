require 'test_helper'

class ReservationFlowTest < ActionDispatch::IntegrationTest
  test "can create reservation" do
    get "/reservations/new"
  	assert_response :success

  	post "/reservations", params: {dress_id: 1, dress_size: 1, delivery_on: "2016-12-01"}
  	assert_response :success
  end
end
