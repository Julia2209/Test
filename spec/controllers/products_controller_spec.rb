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
  
  describe "destroy action" do
    let(:product) { stub_model Product }
    
    before { expect(Product).to receive(:find).with('10').and_return(product) }
    
    before { expect(product).to receive(:destroy).and_return(true) }
    
    before { delete :destroy, id: 10 }
    
    it { should render_template :destroy }
  end
  
  describe "create action" do
    before { @product = stub_model Product }
    
    before { expect(Product).to receive(:new).with('name' => 'Beer', 'description' => 'Good').and_return(@product) }
    
    context do
      before { expect(@product).to receive(:save).and_return(true) }
      
      before { post :create, product: { name: "Beer", description: "Good" } }
      
      it { should render_template :create }
    end
  end
end



 