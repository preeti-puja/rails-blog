class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new

        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @product = Product.create(product_params)

        unless @product.save
            render 'new'
        end
    end

    def edit
        @product = Product.find(params[:id])

        respond_to do |format|
            format.html
            format.js
        end
    end

    def update
        @product = Product.find(params[:id])

        unless @product.update_attributes(product_params)
            render 'edit'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :sku, :quantity, images: [])
    end
end
