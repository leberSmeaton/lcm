require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      user: nil,
      category: nil,
      product_name: "MyString",
      product_description: "MyText",
      product_price: 1,
      product_stock: false
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[product_description]"

      assert_select "input[name=?]", "product[product_price]"

      assert_select "input[name=?]", "product[product_stock]"
    end
  end
end
