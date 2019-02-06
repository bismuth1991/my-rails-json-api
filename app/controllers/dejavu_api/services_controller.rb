class DejavuApi::ServicesController < ApplicationController
  def index
    @services = Service.all 
    render :index
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      render :show
    else
      render json: @service.errors.full_messages, status: 422
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
