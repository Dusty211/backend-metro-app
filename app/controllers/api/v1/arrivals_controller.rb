require 'update_db'

class Api::V1::ArrivalsController < ApplicationController

  def find
    # byebug
  end

  private

  def arrivals_params
    params.permit(:platform_code, :alt_code)
  end

end
