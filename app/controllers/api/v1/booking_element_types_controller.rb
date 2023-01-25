class Api::V1::BookingElementTypesController < ApplicationController
  before_action :set_booking_element_type, only: %i[ show update destroy ]

  # GET /booking_element_types
  def index
    @booking_element_types = BookingElementType.all

    render json: @booking_element_types
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_element_type
      @booking_element_type = BookingElementType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_element_type_params
      params.require(:booking_element_type).permit(:elementtype)
    end
end