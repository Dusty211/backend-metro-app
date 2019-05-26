class Api::V1::PlatformsController < ApplicationController

  def index
    render json: Platform.all
  end

end
