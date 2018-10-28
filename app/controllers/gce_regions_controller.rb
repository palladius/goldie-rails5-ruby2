class GceRegionsController < ApplicationController
  before_action :set_gce_region, only: [:show, :edit, :update, :destroy]

  # GET /gce_regions
  # GET /gce_regions.json
  def index
    @gce_regions = GceRegion.all
  end

  # GET /gce_regions/1
  # GET /gce_regions/1.json
  def show
  end

  # GET /gce_regions/new
  def new
    @gce_region = GceRegion.new
  end

  # GET /gce_regions/1/edit
  def edit
  end

  # POST /gce_regions
  # POST /gce_regions.json
  def create
    @gce_region = GceRegion.new(gce_region_params)

    respond_to do |format|
      if @gce_region.save
        format.html { redirect_to @gce_region, notice: 'Gce region was successfully created.' }
        format.json { render :show, status: :created, location: @gce_region }
      else
        format.html { render :new }
        format.json { render json: @gce_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gce_regions/1
  # PATCH/PUT /gce_regions/1.json
  def update
    respond_to do |format|
      if @gce_region.update(gce_region_params)
        format.html { redirect_to @gce_region, notice: 'Gce region was successfully updated.' }
        format.json { render :show, status: :ok, location: @gce_region }
      else
        format.html { render :edit }
        format.json { render json: @gce_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gce_regions/1
  # DELETE /gce_regions/1.json
  def destroy
    @gce_region.destroy
    respond_to do |format|
      format.html { redirect_to gce_regions_url, notice: 'Gce region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gce_region
      @gce_region = GceRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gce_region_params
      params.require(:gce_region).permit(:name, :address, :description, :default_zones, :is_active)
    end
end
