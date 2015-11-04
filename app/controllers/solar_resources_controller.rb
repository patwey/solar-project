class SolarResourcesController < ApplicationController
  def search
  end

  def show
    @address = params[:solar_resource][:address]
    @resource = SolarResource.data(@address)
  end
end
