require "application_system_test_case"

class RestaurantStaffsTest < ApplicationSystemTestCase
  setup do
    @restaurant_staff = restaurant_staffs(:one)
  end

  test "visiting the index" do
    visit restaurant_staffs_url
    assert_selector "h1", text: "Restaurant staffs"
  end

  test "should create restaurant staff" do
    visit restaurant_staffs_url
    click_on "New restaurant staff"

    fill_in "First name", with: @restaurant_staff.first_name
    fill_in "Last name", with: @restaurant_staff.last_name
    fill_in "Password", with: @restaurant_staff.password
    fill_in "Role", with: @restaurant_staff.role
    fill_in "User name", with: @restaurant_staff.user_name
    click_on "Create Restaurant staff"

    assert_text "Restaurant staff was successfully created"
    click_on "Back"
  end

  test "should update Restaurant staff" do
    visit restaurant_staff_url(@restaurant_staff)
    click_on "Edit this restaurant staff", match: :first

    fill_in "First name", with: @restaurant_staff.first_name
    fill_in "Last name", with: @restaurant_staff.last_name
    fill_in "Password", with: @restaurant_staff.password
    fill_in "Role", with: @restaurant_staff.role
    fill_in "User name", with: @restaurant_staff.user_name
    click_on "Update Restaurant staff"

    assert_text "Restaurant staff was successfully updated"
    click_on "Back"
  end

  test "should destroy Restaurant staff" do
    visit restaurant_staff_url(@restaurant_staff)
    click_on "Destroy this restaurant staff", match: :first

    assert_text "Restaurant staff was successfully destroyed"
  end
end
