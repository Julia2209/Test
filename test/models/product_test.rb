require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should not save product whithout name" do
    product = Product.new
    assert_not product.save, "Saved name without the name"
  end
  
  def test_should_not_save_name_less_than_three_characters
    pr = Product.new(name: "1", description: "21")
    assert_not pr.save, "Product been saved with name less than three charnets" 
  end
  
  def test_should_not_more_than_thirty_characters
    pr = Product.new(name: "12345678901234567890123456789012", description: "Product1")
    assert_not pr.save, "Product been saved with name more than thirty characters"
  end
  
 end

