class Api::Admin::SitesController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Errors
  before_action :set_site, only: %i[ show update destroy ]

  # GET /sites
  def index
    @sites = Site.all

    render jsonapi: @sites
  end

  # GET /sites/1
  def show
    render jsonapi: @site
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      render jsonapi: @site, status: :created
    else
      render jsonapi_errors: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render jsonapi: @site
    else
      render jsonapi_errors: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      jsonapi_deserialize(params, only: [:name, :address, :phonenumber, :contactperson, :email, :isactive])
    end
end