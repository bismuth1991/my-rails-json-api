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
    @technician = Technician.find(params[:id])

    if @technician.update(update_technician_params)
      render :show
    else 
      render json: @technician.errors.full_messages, status: 422
    end
  end

  def destroy
    technician = Technician.find(params[:id])
    technician.destroy

    render json: {}
  end

  private 

  def technician_params
    params.require(:technician).permit(:name, :pin_number, :admin)
  end

  def update_technician_params
    params.require(:technician).permit(:name, :pin_number)
  end
end
