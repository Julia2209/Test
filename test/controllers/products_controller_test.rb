require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  fixtures 'products'
  
  def setup
    @controller = ProductsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end
  
  def test_should_get_home
    get :home
    assert_response :success
    assert_nil assigns(:products)
  end
  
  def test_should_create_product
    assert_difference('Product.count') do
      post :create, product: {name: 'Some Name'}
    end
    
    assert_redirected_to(controller: "products", action: "index")
  end
      
  def test_should_get_new
    get :new
    assert_response :success
    assert_not_nil assigns(:product)
  end
  
  def test_should_update_product 
    put :update, :id => products(:one), product: {:name => 'MyString2'}
    assert_equal "MyString2", assigns(:product).name #Product.find(products(:one)).name
  end
  
  def test_should_delete_product
    assert_no_difference('products.count') do
      products(:one).destroy
      
    end
  end
  

  
end
