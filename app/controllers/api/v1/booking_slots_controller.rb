class Api::V1::BookingSlotsController < ApplicationController
  before_action :set_booking_slot, only: %i[ show update destroy ]

  # GET /booking_slots
  def index
    @booking_slots = BookingSlot.all

    render json: @booking_slots
  end

  # GET /booking_slots/1
  def show
    render json: @booking_slot
  end

  # POST /booking_slots
  def create
    @booking_slot = BookingSlot.new(booking_slot_params)

    if @booking_slot.save
      render json: @booking_slot, status: :created, location: @booking_slot
    else
      render json: @booking_slot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_slots/1
  def update
    if @booking_slot.update(booking_slot_params)
      render json: @booking_slot
    else
      render json: @booking_slot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_slots/1
  def destroy
    @booking_slot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_slot
      @booking_slot = BookingSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_slot_params
      params.require(:booking_slot).permit(:booking_id, :slot_id)
    end
end
