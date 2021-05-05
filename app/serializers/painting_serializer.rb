class PaintingSerializer < ActiveModel::Serializer
  attributes :id
  has_many :colored_polygons, key: :polygons
end
