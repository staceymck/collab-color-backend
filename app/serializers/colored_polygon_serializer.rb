class ColoredPolygonSerializer < ActiveModel::Serializer
  attributes :id, :color, :polygon_id, :points
  belongs_to :painting 
  belongs_to :polygon #only need points for the polygon

  def points
    object.polygon.points
  end
end
