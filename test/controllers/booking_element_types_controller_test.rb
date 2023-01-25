require "test_helper"

class BookingElementTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_element_type = booking_element_types(:one)
  end

  test "should get index" do
    get booking_element_types_url, as: :json
    assert_response :success
  end

  test "should create booking_element_type" do
    assert_difference("BookingElementType.count") do
      post booking_element_types_url, params: { booking_element_type: { elementtype: @booking_element_type.elementtype } }, as: :json
    end

    assert_response :created
  end

  test "should show booking_element_type" do
    get booking_element_type_url(@booking_element_type), as: :json
    assert_response :success
  end

  test "should update booking_element_type" do
    patch booking_element_type_url(@booking_element_type), params: { booking_element_type: { elementtype: @booking_element_type.elementtype } }, as: :json
    assert_response :success
  end

  test "should destroy booking_element_type" do
    assert_difference("BookingElementType.count", -1) do
      delete booking_element_type_url(@booking_element_type), as: :json
    end

    assert_response :no_content
  end
end
