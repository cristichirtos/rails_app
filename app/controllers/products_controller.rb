class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end

  def edit; end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(product_params[:image])
    
    respond_to do |format|
      @product.save ? format.html { redirect_to @product, notice: 'Product added successfully!' }
                    : format.html { render :new }
    end
  end

  def update
    respond_to do |format|
      @product.update(product_params) ? format.html { redirect_to @product, notice: 'Product updated successfully!' }
                                      : format.html { render :edit }
    end
  end

  def destroy
    @product.destroy

    respond_to { |format| format.html { redirect_to dashboard_path, notice: 'Product deleted!' } }
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :image)
    end
end
