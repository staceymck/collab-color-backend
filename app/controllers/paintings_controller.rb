class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :update, :destroy]

  # GET /paintings
  def index
    @paintings = Painting.includes(:colored_polygons => :polygon).all #joins doesn't work here

    render json: @paintings
  end

  # GET /paintings/1
  def show
    render json: @painting
  end

  # POST /paintings
  def create
    byebug
    @painting = Painting.new(painting_params)

    # if @painting.save
    #   render json: @painting, status: :created, location: @painting
    # else
    #   render json: @painting.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /paintings/1
  def update
    if @painting.update(painting_params)
      render json: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paintings/1
  def destroy
    @painting.destroy
  end

  private
    def set_painting
      @painting = Painting.find(params[:id])
    end

    def painting_params
      params.require(:painting).permit(:canvas_id, :colored_polygons => [:id, :color])
    end
end
