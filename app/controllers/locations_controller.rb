class LocationsController < ApplicationController
  before_filter :fetch_organization
  # GET /locations
  # GET /locations.json
  def index
    @locations = @business.locations.all

    @map = Cartographer::Gmap.new( 'map' )
    @map.zoom = :bound
    @map.icons << Cartographer::Gicon.new
  
    @business.locations.each do |location|
      @map.markers << 
        Cartographer::Gmarker.new(
          :name => 'location_'+Digest::MD5.hexdigest(location.name),
          :marker_type => "Building",
          :position => [location.lat, location.lng],
          :info_window_url => "fixme.org"
        )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = @business.locations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = @business.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to [@business, @location], notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to [@business, @location], notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :ok }
    end
  end
  
  private
  
    def fetch_organization
      #raise params.inspect
      @business = Business.find(params[:business_id])
      #@school   = School.find(params[:school_id])
      params.merge!({:organization_id => params.delete(:business_id)})
    end
end


