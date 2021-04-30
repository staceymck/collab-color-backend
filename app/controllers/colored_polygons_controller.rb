class ColoredPolygonsController < ApplicationController
  before_action :set_colored_polygon, only: [:show, :update, :destroy]

  # GET /colored_polygons
  def index
    @colored_polygons = ColoredPolygon.all

    render json: @colored_polygons
  end

  # GET /colored_polygons/1
  def show
    render json: @colored_polygon
  end

  # POST /colored_polygons
  def create
    @colored_polygon = ColoredPolygon.new(colored_polygon_params)

    if @colored_polygon.save
      render json: @colored_polygon, status: :created, location: @colored_polygon
    else
      render json: @colored_polygon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colored_polygons/1
  def update
    if @colored_polygon.update(colored_polygon_params)
      render json: @colored_polygon
    else
      render json: @colored_polygon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colored_polygons/1
  def destroy
    @colored_polygon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colored_polygon
      @colored_polygon = ColoredPolygon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def colored_polygon_params
      params.require(:colored_polygon).permit(:painting_id, :polygon_id, :color)
    end
end
