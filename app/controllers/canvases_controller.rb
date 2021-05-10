class CanvasesController < ApplicationController

  def index
    @canvases = Canvas.includes(:polygons).all

    render json: @canvases
  end
end
