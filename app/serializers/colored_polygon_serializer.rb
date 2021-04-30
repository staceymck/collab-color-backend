class ColoredPolygonSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :painting 
  belongs_to :polygon #only need points for the polygon
end
