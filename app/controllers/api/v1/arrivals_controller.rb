require 'update_db'

class Api::V1::ArrivalsController < ApplicationController

  def find
    station = SourcePlatform.find_by(code: params["code"])
    # byebug
  end

  private

  def arrivals_params
    params.permit(:code)
  end

end
