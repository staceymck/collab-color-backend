class PaintingsController < ApplicationController

  def index
    sorted_paintings = Painting.applySort(params[:q]).includes(:colored_polygons => :polygon).all
    @paintings = sorted_paintings.page(page).per(18)

    render json: {
      paintings: ActiveModel::Serializer::CollectionSerializer.new(@paintings, serializer: PaintingSerializer),
      current: @paintings.current_page,
      total: @paintings.total_pages
    }
  end

  # POST /paintings
  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      render json: @painting, status: :created, location: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end


  private

    def page
      params[:page] ? params[:page].to_i : 1 
    end

    def painting_params
      params.require(:painting).permit(:canvas_id, :colored_polygons_attributes => [:polygon_id, :color])
    end
end
