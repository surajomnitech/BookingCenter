require "test_helper"

class BookingElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_element = booking_elements(:one)
  end

  test "should get index" do
    get booking_elements_url, as: :json
    assert_response :success
  end

  test "should create booking_element" do
    assert_difference("BookingElement.count") do
      post booking_elements_url, params: { booking_element: { availablefrom: @booking_element.availablefrom, booking_element_type_id: @booking_element.booking_element_type_id, bookingcyclelength: @booking_element.bookingcyclelength, isactive: @booking_element.isactive, name: @booking_element.name, rate: @booking_element.rate, renewauto: @booking_element.renewauto, site_id: @booking_element.site_id, timeslotlengthhr: @booking_element.timeslotlengthhr } }, as: :json
    end

    assert_response :created
  end

  test "should show booking_element" do
    get booking_element_url(@booking_element), as: :json
    assert_response :success
  end

  test "should update booking_element" do
    patch booking_element_url(@booking_element), params: { booking_element: { availablefrom: @booking_element.availablefrom, booking_element_type_id: @booking_element.booking_element_type_id, bookingcyclelength: @booking_element.bookingcyclelength, isactive: @booking_element.isactive, name: @booking_element.name, rate: @booking_element.rate, renewauto: @booking_element.renewauto, site_id: @booking_element.site_id, timeslotlengthhr: @booking_element.timeslotlengthhr } }, as: :json
    assert_response :success
  end

  test "should destroy booking_element" do
    assert_difference("BookingElement.count", -1) do
      delete booking_element_url(@booking_element), as: :json
    end

    assert_response :no_content
  end
end
