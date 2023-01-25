require "test_helper"

class BookingStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_status = booking_statuses(:one)
  end

  test "should get index" do
    get booking_statuses_url, as: :json
    assert_response :success
  end

  test "should create booking_status" do
    assert_difference("BookingStatus.count") do
      post booking_statuses_url, params: { booking_status: { status: @booking_status.status } }, as: :json
    end

    assert_response :created
  end

  test "should show booking_status" do
    get booking_status_url(@booking_status), as: :json
    assert_response :success
  end

  test "should update booking_status" do
    patch booking_status_url(@booking_status), params: { booking_status: { status: @booking_status.status } }, as: :json
    assert_response :success
  end

  test "should destroy booking_status" do
    assert_difference("BookingStatus.count", -1) do
      delete booking_status_url(@booking_status), as: :json
    end

    assert_response :no_content
  end
end
