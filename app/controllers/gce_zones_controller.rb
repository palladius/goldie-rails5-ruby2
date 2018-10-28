class GceZonesController < ApplicationController
  before_action :set_gce_zone, only: [:show, :edit, :update, :destroy]

  # GET /gce_zones
  # GET /gce_zones.json
  def index
    @gce_zones = GceZone.all
  end

  # GET /gce_zones/1
  # GET /gce_zones/1.json
  def show
  end

  # GET /gce_zones/new
  def new
    @gce_zone = GceZone.new
  end

  # GET /gce_zones/1/edit
  def edit
  end

  # POST /gce_zones
  # POST /gce_zones.json
  def create
    #@gce_region = GceRegion.find(params[:gce_region_id])
    #@gce_zone = @gce_region.gce_zones.create(params[:gce_zone])
    #redirect_to region_path(@region)

    @gce_zone = GceZone.new(gce_zone_params)

    respond_to do |format|
      if @gce_zone.save
        format.html { redirect_to @gce_zone, notice: 'Gce Zone was successfully created.' }
        format.json { render :show, status: :created, location: @gce_zone }
      else
        format.html { render :new }
        format.json { render json: @gce_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gce_zones/1
  # PATCH/PUT /gce_zones/1.json
  def update
    respond_to do |format|
      if @gce_zone.update(gce_zone_params)
        format.html { redirect_to @gce_zone, notice: 'Gce zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @gce_zone }
      else
        format.html { render :edit }
        format.json { render json: @gce_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gce_zones/1
  # DELETE /gce_zones/1.json
  def destroy
    @gce_zone.destroy
    respond_to do |format|
      format.html { redirect_to gce_zones_url, notice: 'Gce zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gce_zone
      @gce_zone = GceZone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gce_zone_params
      params.require(:gce_zone).permit(:name, :is_active, :GceRegion_id)
    end
end
