class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @gardens = Garden.all
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.head_gardener = current_user
    if @garden.save
      GardenOwnership.create(user: current_user, garden: @garden)
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
    flash[:notice] = "Garden succesfully destroyed"
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:maximum_number_of_participants, :whatsapp_group_url)
  end
end
