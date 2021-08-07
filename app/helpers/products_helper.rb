module ProductsHelper
    def image_select(product)
        return product.product_image if product.product_image.attached?
        # if no product image attached the default placeholder image will be used.
        return "placeholder.jpg"
    end
end
