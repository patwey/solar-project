class SolarResourcesController < ApplicationController
  def index
    @resource = SolarResource.gimme
  end
end
