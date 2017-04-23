class HarvestsController < ApplicationController
  before_action :set_garden, only: [:create, :update, :destroy]
  before_action :set_harvest, only: [:edit, :update, :destroy]

  def new
    @harvest = Harvest.new
  end

  def create
    @harvest = Harvest.new(harvest_params)
    @harvest.garden = @garden
    if @harvest.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @harvest.update(harvest_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @harvest.destroy
    redirect_to garden_path(@garden)
    flash[:notice] = "Harvest succesfully destroyed"
  end

  private

  def set_harvest
    @harvest = Harvest.find(params[:id])
  end

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def harvest_params
    params.require(:harvest).permit(:start_date, :end_date)
  end
end
