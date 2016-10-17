require 'test_helper'

class DressTest < ActiveSupport::TestCase
  def setup
  	@dress = Dress.new(name: "Floral Print Dress")
  end

  # Validity of the object
  test "should be valid" do
  	assert @dress.valid?  	
  end

  # Validation for name should be present
  test "name should be present" do
  	@dress.name = ""
  	assert_not @dress.valid?
  end
end
