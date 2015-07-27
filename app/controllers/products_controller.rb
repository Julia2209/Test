class ProductsController < ApplicationController
  
  before_action :find_params_id, only: [:edit, :show, :update, :destroy]
  
  def index
    @products = Product.all
  end
  
  def show
  end
  
  def new
    @product = Product.new
  end
  
  def edit
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render 'new'
    end
  end
  
  def update
    if @product.update(product_params)
      redirect_to products_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @product.destroy
    
    redirect_to products_url
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end
    
    def find_params_id
      @product = Product.find(params[:id])
    end
end
