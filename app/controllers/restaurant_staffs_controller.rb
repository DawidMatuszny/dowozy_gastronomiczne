class RestaurantStaffsController < ApplicationController
  before_action :set_restaurant_staff, only: %i[ show edit update destroy ]

  # GET /restaurant_staffs or /restaurant_staffs.json
  def index
    @restaurant_staffs = RestaurantStaff.all
  end

  # GET /restaurant_staffs/1 or /restaurant_staffs/1.json
  def show
  end

  # GET /restaurant_staffs/new
  def new
    @restaurant_staff = RestaurantStaff.new
  end

  # GET /restaurant_staffs/1/edit
  def edit
  end

  # POST /restaurant_staffs or /restaurant_staffs.json
  def create
    @restaurant_staff = RestaurantStaff.new(restaurant_staff_params)

    respond_to do |format|
      if @restaurant_staff.save
        format.html { redirect_to restaurant_staff_url(@restaurant_staff), notice: "Restaurant staff was successfully created." }
        format.json { render :show, status: :created, location: @restaurant_staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_staffs/1 or /restaurant_staffs/1.json
  def update
    respond_to do |format|
      if @restaurant_staff.update(restaurant_staff_params)
        format.html { redirect_to restaurant_staff_url(@restaurant_staff), notice: "Restaurant staff was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_staffs/1 or /restaurant_staffs/1.json
  def destroy
    @restaurant_staff.destroy!

    respond_to do |format|
      format.html { redirect_to restaurant_staffs_url, notice: "Restaurant staff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_staff
      @restaurant_staff = RestaurantStaff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_staff_params
      params.require(:restaurant_staff).permit(:user_name, :password, :first_name, :last_name, :role)
    end
end
