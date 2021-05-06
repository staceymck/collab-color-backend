class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :update, :destroy]

  # GET /paintings
  def index
    sorted_paintings = Painting.applySort(params[:q]).includes(:colored_polygons => :polygon).all
    @paintings = sorted_paintings.page(page).per(18)

    render json: {
      paintings: ActiveModel::Serializer::CollectionSerializer.new(@paintings, serializer: PaintingSerializer),
      current: @paintings.current_page,
      total: @paintings.total_pages
    }
  end

  # GET /paintings/1
  def show
    render json: @painting
  end

  # POST /paintings
  def create
    byebug
   # Do I need to pass in canvas_id and attributes hash here, not the painting_params as is?
   # @painting = Painting.new(painting_params)

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

    def page
      params[:page] ? params[:page].to_i : 1
    end

    def painting_params
      params.require(:painting).permit(:canvas_id, :colored_polygons_attributes => [:polygon_id, :color])
    end
end
