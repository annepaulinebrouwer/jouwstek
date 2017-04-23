class GardenLocationsController < ApplicationController
  before_action :set_garden_location, only: [:edit, :update, :destroy]
  before_action :set_garden, only: [:create, :update, :destroy]
  def new
    @garden_location = GardenLocation.new
  end

  def create
    @garden_location = GardenLocation.new(garden_location_params)
    @garden_location.garden = @garden
    if @garden_location.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @garden_location.update(garden_location_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden_location.destroy
    redirect_to garden_path(@garden)
    flash[:notice] = "Succesfully removed location"
  end

  private 

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_garden_location
  end

  def garden_location_params
    params.require(:garden_location).permit(:latitude, :longitude)
  end
end
