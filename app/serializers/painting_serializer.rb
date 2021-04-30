class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  has_many :colored_polygons
end
