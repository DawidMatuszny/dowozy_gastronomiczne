class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  #before_action :require_login   

  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1 or /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully created." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def shopping_cart
    if current_user && current_user.orders.in_progress.first
      @order = current_user.orders.in_progress.first
      @order_items = @order.order_items if @order
    end
  end


  def create_order
      dwa = params[:dwa].to_i
      trzy = params[:trzy].to_i
      if !current_user.orders.in_progress.first
          @order = current_user.orders.create(user_id: current_user.id, order_date: Time.current,  status: 1) 
      end
        jed = current_user.orders.in_progress.first.id
        @order_item = OrderItem.create(order_id: jed, product_id: dwa, quantity: trzy)
        @order_item.save
         respond_to do |format|
        format.html { redirect_to shopping_cart_path, notice: "Order item was successfully created." }
        format.json { render json: @order_item, status: :created }
      end
    end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy!

    respond_to do |format|
      format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity)
    end
end


  private

  def require_login
    unless logged_in2?
      redirect_to root_path 
    end
  end

