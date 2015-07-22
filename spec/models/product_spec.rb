require 'rails_helper'

describe Product do
  
  before { @product = Product.new(name: "Product", description: "Description") }
  
  subject { @product }
  
  it { should respond_to(:name) }
  
  it { should respond_to(:description) }
  
  it { should be_valid }
  
  describe "name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end
  
  describe "name length" do
    before {  @product.name = "a" * 50 }
    it { should_not be_valid }
  end
  
  describe "name unique" do
    before do
      same_product = @product.dup
      same_product.save
    end
    
    it { should_not be_valid }
  end
  
  describe "name register" do
    before do
      same_product = @product.dup
      same_product.name = @product.name.upcase
      same_product.save
    end
    
    it { should_not be_valid }
  end
end