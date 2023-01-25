class Api::V1::BookingElementAvailableTimesController < ApplicationController
before_action :set_booking_element_available_time, only: %i[ show update destroy ]

# GET /booking_element_available_times
def index
  @booking_element_available_times = BookingElementAvailableTime.all

  render json: @booking_element_available_times
end

# GET /booking_element_available_times/1
def show
  render json: @booking_element_available_time
end

# POST /booking_element_available_times
def create
  @booking_element_available_time = BookingElementAvailableTime.new(booking_element_available_time_params)

  if @booking_element_available_time.save
    render json: @booking_element_available_time, status: :created, location: @booking_element_available_time
  else
    render json: @booking_element_available_time.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /booking_element_available_times/1
def update
  if @booking_element_available_time.update(booking_element_available_time_params)
    render json: @booking_element_available_time
  else
    render json: @booking_element_available_time.errors, status: :unprocessable_entity
  end
end

# DELETE /booking_element_available_times/1
def destroy
  @booking_element_available_time.destroy
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking_element_available_time
    @booking_element_available_time = BookingElementAvailableTime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_element_available_time_params
    params.require(:booking_element_available_time).permit(:weekday, :start_time, :openhours, :booking_element_id)
  end
end
