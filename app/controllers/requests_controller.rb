class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.status = "Pending"
    if @request.save
      redirect_to garden_path(@garden)
      flash[:notice] = "Succesfully sent a request"
    else
      redirect_to garden_path(@garden)
      flash[:notice] = "Failed to create a request"
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def request_params
    params.require(:request).permit(:message)
  end
end
