class DejavuApi::ServicesController < ApplicationController
  def index
    @services = Service.all 

    render :index
  end
end
