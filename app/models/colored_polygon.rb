class ColoredPolygon < ApplicationRecord
  belongs_to :painting
  belongs_to :polygon
end
