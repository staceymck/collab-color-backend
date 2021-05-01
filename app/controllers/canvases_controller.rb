class CanvasesController < ApplicationController
  before_action :set_canvas, only: [:show, :update, :destroy]

  # GET /canvases
  def index
    @canvases = Canvas.includes(:polygons).all

    render json: @canvases
  end

  # GET /canvases/1
  def show
    render json: @canvas
  end

  # POST /canvases
  def create
    @canvas = Canvas.new(canvas_params)

    if @canvas.save
      render json: @canvas, status: :created, location: @canvas
    else
      render json: @canvas.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /canvases/1
  def update
    if @canvas.update(canvas_params)
      render json: @canvas
    else
      render json: @canvas.errors, status: :unprocessable_entity
    end
  end

  # DELETE /canvases/1
  def destroy
    @canvas.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canvas
      @canvas = Canvas.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def canvas_params
      params.require(:canvas).permit(:name)
    end
end
