require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get availability" do
    get :availability
    assert_response :success
  end

end
