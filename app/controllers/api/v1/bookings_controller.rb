class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]
  include JSONAPI::Deserialization
  include JSONAPI::Errors
  include JSONAPI::Fetching
  # GET /bookings
  def index
    @bookings = Booking.all

    render jsonapi: @bookings
  end

  # GET /bookings/1
  def show
    render jsonapi: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    
    if @booking.save
      
      slots_params.each do |slot|
        
        update_slot = Slot.find(slot[:id].to_i)
          update_slot.allocated = slot[:allocated]
          update_slot.booking_id = @booking.id
          update_slot.save
          byebug
      end

      render jsonapi: @booking, status: :created
    else
      render jsonapi_errors: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      slots_params.each do |slot|
          update_slot = Slot.find(slot[:id].to_i)
          update_slot.allocated = slot[:allocated]
          update_slot.booking_id = slot[:allocated] ? @booking.id : nil
          update_slot.save
      end

      render jsonapi: @booking
    else
      render jsonapi_errors: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :booking_element_id, :bookingdate, :bookingstatus, :repeatcount, :repeatevery, :notes)
    end

    def slots_params
      params.fetch(:slots)
    end
end
