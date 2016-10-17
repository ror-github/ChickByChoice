require 'test_helper'

class DressSizeTest < ActiveSupport::TestCase
  def setup
  	@dress = Dress.new(name: "Floral Print Dress")
  	@dress_size = @dress.dress_sizes.build(size: 1)
  end

  # Validity of the object
  test "should be valid" do
  	assert @dress_size.valid?  	
  end

  # Validation for size should be present
  test "size should be present" do
  	@dress_size.size = nil
  	assert_not @dress_size.valid?
  end

  # Validation for size should be a number
  test "size should be a number" do
  	is_number = @dress_size.size.is_a? Integer
  	assert_operator is_number, :==, true
  end
end
