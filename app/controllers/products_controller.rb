class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_categories, only: [:new, :edit]


  # GET /products page that lists all products
  # explicitly renders the products index.html.erb file in products views folder
  def index
    @products = Product.all
    # we will loop through every product and its attributes in index.html.erb 
  end

  # GET /products/1 renders show.html.erb that shows individual products
  # creating payment intent, showing our Stripe gem payment option when we render the page for each product
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user&.email,
      line_items: [{
        name: @product.product_name,
        description: @product.product_description,
        amount: @product.product_price * 100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user&.id,
          product_id: @product.id
        }
      },
      success_url: "#{root_url}/products/#{@product.id}",
      cancel_url: "#{root_url}/products"
    )
    
    @session_id = session.id
    puts "*******"
    pp @session_id
    puts "*******"
  end

  # GET /products/new page that allows creation of individual product
  # explicitly renders the products new.html.erb file in products views folder
  def new
    @product = Product.new
  end

  # GET /products/1/edit page that allows edit of an individual product
  # explicitly renders the products edit.html.erb file in products views folder
  def edit
  end

  # POST /products does not render a page
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 does not render a page
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 does not render a page
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only our trusted attribute parameters are passed through. 
    def product_params
      params.require(:product).permit(:user_id, :category_id, :product_name, :product_description, :product_price, :product_stock, :product_image)
    end

    def set_categories
      @categories = Category.all
      # this find params doesn't work, gets can't find params id
      # @categories = Category.find(params[:id])
    end
end
