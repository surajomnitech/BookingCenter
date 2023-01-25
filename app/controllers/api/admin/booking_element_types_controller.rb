class Api::Admin::BookingElementTypesController < ApplicationController
  before_action :set_booking_element_type, only: %i[ show update destroy ]
  include JSONAPI::Deserialization
  include JSONAPI::Errors
  # GET /booking_element_types
  def index
    @booking_element_types = BookingElementType.all

    render jsonapi: @booking_element_types
  end

  # GET /booking_element_types/1
  def show
    render jsonapi: @booking_element_type
  end

  # POST /booking_element_types
  def create
    @booking_element_type = BookingElementType.new(booking_element_type_params)

    if @booking_element_type.save
      render jsonapi: @booking_element_type, status: :created
    else
      render jsonapi_errors: @booking_element_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_element_types/1
  def update
    if @booking_element_type.update(booking_element_type_params)
      render jsonapi: @booking_element_type
    else
      render jsonapi_errors: @booking_element_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_element_types/1
  def destroy
    @booking_element_type.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_element_type
      @booking_element_type = BookingElementType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_element_type_params
      jsonapi_deserialize(params, only: [:elementtype])
    end
end