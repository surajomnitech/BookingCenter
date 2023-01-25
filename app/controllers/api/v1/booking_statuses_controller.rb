class Api::V1::BookingStatusesController < ApplicationController
before_action :set_booking_status, only: %i[ show update destroy ]

  # GET /booking_statuses
  def index
    @booking_statuses = BookingStatus.all

    render json: @booking_statuses
  end

  # GET /booking_statuses/1
  def show
    render json: @booking_status
  end

  # POST /booking_statuses
  def create
    @booking_status = BookingStatus.new(booking_status_params)

    if @booking_status.save
      render json: @booking_status, status: :created, location: @booking_status
    else
      render json: @booking_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_statuses/1
  def update
    if @booking_status.update(booking_status_params)
      render json: @booking_status
    else
      render json: @booking_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_statuses/1
  def destroy
    @booking_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_status
      @booking_status = BookingStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_status_params
      params.require(:booking_status).permit(:status)
    end
end
