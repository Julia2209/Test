require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "edit action" do
    before { @product = create(:product) }
    
    before { get :edit, id: @product.id }
    
    it { should render_template :edit }
  end
  
  describe "new action" do
    before { get :new, product: { name: "Product new" } }
    
    it { should render_template :new }
  end
  
  describe "create action" do
    before { @product = stub_model Product }
    
    before { expect(Product).to receive(:new).with('name' => 'Beer', 'description' => 'Good').and_return(@product) }
    
    context do
      before { expect(@product).to receive(:save).and_return(true) }
      
      before { post :create, product: { name: "Beer", description: "Good" } }
      
      it { should redirect_to(product_path(@product.id)) }
    end
    context do
      before { expect(@product).to receive(:save).and_return(false) }
      
      before { post :create, product: { name: "Beer", description: "Good" } }
      
      it { should render_template :new }
    end
  end
  
  describe "update action" do
    let(:product) { stub_model Product }

    before { expect(Product).to receive(:find).with('12').and_return(product) }

    context do
      before { expect(product).to receive(:update).with('name' => 'Milk').and_return(true) }

      before { patch :update, id: 12, product: { name: 'Milk' } }

      it { should redirect_to(product_path(product)) }
    end
    
    context do
      before { expect(product).to receive(:update).with('name' => 'Milk').and_return(false) }
      
      before { patch :update, id: 12, product:{ name: 'Milk' } }
      
      it { should render_template :edit }
    end
  end
  
  describe "destroy action" do
    let(:product) { stub_model Product }
    
    before { expect(Product).to receive(:find).with('10').and_return(product) }
    
    before { expect(product).to receive(:destroy).and_return(true) }
    
    before { delete :destroy, id: 10 }
    
    it { should redirect_to(products_url) }
  end
end



 