require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  
  describe "create action" do
    
    it "redirect to products" do
      post :create, product: { name: "Prod1", description: "Desc1" }
      response.should redirect_to(products_url)
    end
    
    it "rediredt to new" do
      post :create, product: { description: "Des1" }
      response.should render_template('new')
    end
    
  end
  
  
end