class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update]
  def index
    @requests = Request.where(user: current_user)
  end

  def show
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to dashboard_path
      flash[:notice] = "Succesfully updated request"
    else
      redirect_to dashboard_path
      flash[:notice] = "Failed to update request"
    end
  end

  def confirm
    @request.status = "Confirmed"
    flash[:notice] = "Succesfully confirmed request"
    redirect_to garden_path(@request.garden)
  end

  def cancel
    @request.status = "Denied"
    flash[:notice] = "Succesfully declined request"
    redirect_to dashboard_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:message)
  end
end
