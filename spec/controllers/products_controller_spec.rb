require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  
  describe "create action" do
    it "redirect to products" do
      post :create, product: { name: "Prod1", description: "Desc1" }
      expect(@product).to redirect_to(products_url)
    end
    
    it "rediredt to new" do
      post :create, product: { description: "Des1" }
      expect(@product).to render_template('new')
    end
  end
  
  describe "new action" do
    it "shoud render to new" do
      get :new, product: { name: "Prod1", description: "Desc1" }
      expect(@product).to render_template('new')
    end
  end
  
  describe "edit action" do
    it "redirect to edit" do
      product = create(:product)
      get :edit, id: product.id
      expect(product).to render_template('edit')
    end
  end
  
  describe "destroy action" do
    it "redirect to index product" do
      product = create(:product)
      delete :destroy, id: product.id 
      expect(product).to redirect_to(products_path)
    end
  end
  
  describe "update action" do
    it "redirect to index product" do
      product = create(:product)
      patch :update, id: product.id, product: {name: "Beer"}
      expect(product).to redirect_to(products_path)
    end
    
    it "render edit template" do
      product = create(:product)
      patch :update, id: product.id, product: {name: ""}
      expect(product).to render_template('edit')
    end
  end
end