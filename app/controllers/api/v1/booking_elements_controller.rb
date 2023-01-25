class Api::V1::BookingElementsController < ApplicationController
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

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_booking_element
     @booking_element = BookingElement.find(params[:id])
   end

   # Only allow a list of trusted parameters through.
   def booking_element_params
     params.require(:booking_element).permit(:name, :availablefrom, :booking_element_type_id, :timeslotlengthhr, :renewauto, :rate, :bookingcyclelength, :isactive, :site_id)
   end

   def jsonapi_include
     super & ['slots']
   end
end
