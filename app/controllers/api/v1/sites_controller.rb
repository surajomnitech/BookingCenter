class Api::V1::SitesController < ApplicationController
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:name, :address, :phonenumber, :contactperson, :email, :isactive)
    end
end