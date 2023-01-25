require "test_helper"

class BookingElementAvailableTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_element_available_time = booking_element_available_times(:one)
  end

  test "should get index" do
    get booking_element_available_times_url, as: :json
    assert_response :success
  end

  test "should create booking_element_available_time" do
    assert_difference("BookingElementAvailableTime.count") do
      post booking_element_available_times_url, params: { booking_element_available_time: { booking_element_id: @booking_element_available_time.booking_element_id, openhours: @booking_element_available_time.openhours, start_time: @booking_element_available_time.start_time, weekday: @booking_element_available_time.weekday } }, as: :json
    end

    assert_response :created
  end

  test "should show booking_element_available_time" do
    get booking_element_available_time_url(@booking_element_available_time), as: :json
    assert_response :success
  end

  test "should update booking_element_available_time" do
    patch booking_element_available_time_url(@booking_element_available_time), params: { booking_element_available_time: { booking_element_id: @booking_element_available_time.booking_element_id, openhours: @booking_element_available_time.openhours, start_time: @booking_element_available_time.start_time, weekday: @booking_element_available_time.weekday } }, as: :json
    assert_response :success
  end

  test "should destroy booking_element_available_time" do
    assert_difference("BookingElementAvailableTime.count", -1) do
      delete booking_element_available_time_url(@booking_element_available_time), as: :json
    end

    assert_response :no_content
  end
end
