class Product < ApplicationRecord
    
alidates :name, :price, :quantity, :sku, presence: true

    has_many_attached :images
end
