class PolygonsController < ApplicationController
  before_action :set_polygon, only: [:show, :update, :destroy]

  # GET /polygons
  def index
    @polygons = Polygon.all

    render json: @polygons
  end

  # GET /polygons/1
  def show
    render json: @polygon
  end

  # POST /polygons
  def create
    @polygon = Polygon.new(polygon_params)

    if @polygon.save
      render json: @polygon, status: :created, location: @polygon
    else
      render json: @polygon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polygons/1
  def update
    if @polygon.update(polygon_params)
      render json: @polygon
    else
      render json: @polygon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /polygons/1
  def destroy
    @polygon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polygon
      @polygon = Polygon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def polygon_params
      params.require(:polygon).permit(:canvas_id, :points)
    end
end
