require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      user: nil,
      category: nil,
      product_name: "MyString",
      product_description: "MyText",
      product_price: 1,
      product_stock: false
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[product_description]"

      assert_select "input[name=?]", "product[product_price]"

      assert_select "input[name=?]", "product[product_stock]"
    end
  end
end
