class CropsController < ApplicationController
  before_action :set_crop, only: [:edit, :update, :destroy]
  before_action :set_harvest, only: [:create, :update, :destroy]

  def new
    @crop = Crop.new
  end

  def create
    @crop = Crop.new(crop_params)
    @crop.harvest = @harvest
    if @crop.save
      redirect_to garden_harvest_path(@harvest)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @crop.update(crop_params)
      redirect_to garden_harvest_path(@harvest)
    else
      render :edit
    end
  end

  def destroy
    @crop.destroy
    redirect_to garden_harvest_path(@harvest)
    flash[:notice] = "Crop succesfully removed"
  end

  private

  def set_harvest
    @harvest = Harvest.find(params[:harvest_id])
  end

  def set_crop
    @crop = Crop.find(params[:id])
  end

  def crop_params
    params.require(:crop).permit(:type, :quantity, :measurement_unit)
  end
end
