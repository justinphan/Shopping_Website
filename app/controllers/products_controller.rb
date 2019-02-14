class ProductsController < ApplicationController
  before_action :admin_user,     only: [:new, :create, :destroy]
  def new
    @product = Product.new
  end

    def index
      @products = Product.all
      @order_item = current_order.order_items.new
    end

    def search2
      name = params[:search2] + '%'
      @products = Product.where(['name LIKE ?', name])
      @order_item = current_order.order_items.new

    end

    def create
       @product = Product.new(product_params)
       if @product.save
         flash[:success] = "Created!"
         redirect_to products_index_url
         # Handle a successful save.
       else
         render 'new'
       end
     end

     def destroy
       # Still work on this function because removing a product would need to remove products from all cart
          # Product.find(params[:id]).destroy
          # flash[:success] = "Product deleted"
          # redirect_to products_index_url
     end

     def edit
       @product = Product.find(params[:id])
     end

     def update
       @product = Product.find(params[:id])
       if @product.update_attributes(product_params)
               # Handle a successful update.
               flash[:success] = "Product updated"
               redirect_to products_index_url
       else
         render 'edit'
       end
     end

private

    def product_params
     params.require(:product).permit(:name, :price, :active)
    end

  end
