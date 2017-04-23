class DashboardsController < ApplicationController

  def show
    @garden_ownerships = GardenOwnership.where(user: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :email)
  end
end
