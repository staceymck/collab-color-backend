class CanvasSerializer < ActiveModel::Serializer
  attributes :id

  has_many :polygons
end
