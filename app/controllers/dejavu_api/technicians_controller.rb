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

  end

  def update

  end

  def destroy

  end
end
