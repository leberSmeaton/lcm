require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        user: nil,
        category: nil,
        product_name: "Product Name",
        product_description: "MyText",
        product_price: 2,
        product_stock: false
      ),
      Product.create!(
        user: nil,
        category: nil,
        product_name: "Product Name",
        product_description: "MyText",
        product_price: 2,
        product_stock: false
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Product Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
