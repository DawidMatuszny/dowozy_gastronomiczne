require "test_helper"

class RestaurantStaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_staff = restaurant_staffs(:one)
  end

  test "should get index" do
    get restaurant_staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_staff_url
    assert_response :success
  end

  test "should create restaurant_staff" do
    assert_difference("RestaurantStaff.count") do
      post restaurant_staffs_url, params: { restaurant_staff: { first_name: @restaurant_staff.first_name, last_name: @restaurant_staff.last_name, password: @restaurant_staff.password, role: @restaurant_staff.role, user_name: @restaurant_staff.user_name } }
    end

    assert_redirected_to restaurant_staff_url(RestaurantStaff.last)
  end

  test "should show restaurant_staff" do
    get restaurant_staff_url(@restaurant_staff)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_staff_url(@restaurant_staff)
    assert_response :success
  end

  test "should update restaurant_staff" do
    patch restaurant_staff_url(@restaurant_staff), params: { restaurant_staff: { first_name: @restaurant_staff.first_name, last_name: @restaurant_staff.last_name, password: @restaurant_staff.password, role: @restaurant_staff.role, user_name: @restaurant_staff.user_name } }
    assert_redirected_to restaurant_staff_url(@restaurant_staff)
  end

  test "should destroy restaurant_staff" do
    assert_difference("RestaurantStaff.count", -1) do
      delete restaurant_staff_url(@restaurant_staff)
    end

    assert_redirected_to restaurant_staffs_url
  end
end
