class GardenParticipationsController < ApplicationController
  before_action :set_garden


  # This create action should only happen after a request is approved, should be moved to
  # requests controller once request logic is implemented
  def create
    @garden_participation = GardenParticipation.new
    @garden_participation.garden = @garden
    @garden_participation.user = current_user
    if @garden_participation.save
      redirect_to garden_path(@garden)
      flash[:notice] = "Succesfully joined garden"
    else
      redirect_to garden_path(@garden)
      flash[:notice] = "Something went wrong, didn't join the garden ):"
    end
  end

  def destroy
    @garden_participation = GardenParticipation.find(params[:id])
    @garden_participation.destroy
    redirect_to garden_path(@garden)
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end
end
