class Polygon < ApplicationRecord
  belongs_to :canvas
  has_many :colored_polygons
end
