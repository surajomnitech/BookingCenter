class Api::Admin::BookingElementsController < ApplicationController
   include JSONAPI::Deserialization
   include JSONAPI::Errors
   include JSONAPI::Fetching
  before_action :set_booking_element, only: %i[ show update destroy ]

  # GET /booking_elements
  def index
    @booking_elements = BookingElement.all

    render jsonapi: @booking_elements
  end

  # GET /booking_elements/1
  def show
    render jsonapi: @booking_element
  end

  # POST /booking_elements
  def create
    
    @booking_element = BookingElement.new(booking_element_params)

    if @booking_element.save

      booking_element_available_times_params.each do |available_time|
        BookingElementAvailableTime.create(
          weekday: available_time[:weekday],
          start_time: available_time[:start_time].to_time,
          openhours: available_time[:openhours],
          booking_element_id: @booking_element.id
        )
      end

      GenerateSlotsJob.perform_later(@booking_element.id.to_s)

      render jsonapi: @booking_element, status: :created
    else
      render jsonapi_errors: @booking_element.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_elements/1
  # def update
  #   if @booking_element.update(booking_element_params)
  #     render jsonapi: @booking_element
  #   else
  #     render jsonapi_errors: @booking_element.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /booking_elements/1
  def destroy

    Slot.where(booking_element_id: @booking_element.id).destroy_all
    BookingElementAvailableTime.where(booking_element_id: @booking_element.id).destroy_all
    @booking_element.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_element
      @booking_element = BookingElement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_element_params
      params.require(:booking_element).permit(:name, :availablefrom, :booking_element_type_id, :timeslotlengthhr, :renewauto, :rate, :bookingcyclelength, :isactive, :site_id)
    end

    def booking_element_available_times_params
      params.fetch(:booking_element_available_times)
    end

    def jsonapi_include
      super & ['booking_element_available_times']
    end
end
