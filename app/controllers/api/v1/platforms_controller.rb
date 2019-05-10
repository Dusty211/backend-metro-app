class Api::V1::PlatformsController < ApplicationController

  def index
    render json: SourcePlatform.all
  end

end
