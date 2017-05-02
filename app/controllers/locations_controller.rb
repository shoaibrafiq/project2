class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
    #these actions will take place before any other


  def index
    @locations = Location.all #displaying all locations
  end

  def search #searching with and showing longitude/ latitude with geocoder gem
    if params[:search].present?
      @location = params[:search]
      location = Geocoder.coordinates(params[:search])
      @latitude = location[0]
      @longitude = location[1]
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end


  def create  #creating new location and saving it in database and displaying success message
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end


  def update #when location is edited this action updates database and displays success message
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

#destroy action removes from location from database and displays success message
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    #  callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end


    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end
