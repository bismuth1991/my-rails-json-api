class DejavuApi::TechniciansController < ApplicationController
  def index
    @technicians = Technician.all 
    render :index
  end
  
  def show
    @technician = Technician.find(params[:id])
    render :show
  end

  def create
    @technician = Technician.new(technician_params)

    if @technician.save
      render :show
    else
      render json: @technician.errors.full_messages, status: 422
    end
  end

  def update

  end

  def destroy

  end

  private 

  def technician_params
    params.require(:technician).permit(:name, :pin_number, :admin)
  end
end
