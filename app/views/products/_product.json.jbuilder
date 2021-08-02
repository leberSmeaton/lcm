json.extract! product, :id, :user_id, :category_id, :product_name, :product_description, :product_price, :product_stock, :created_at, :updated_at
json.url product_url(product, format: :json)
