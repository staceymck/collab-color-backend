class ColoredPolygon < ApplicationRecord
  belongs_to :painting
  belongs_to :polygon

  validates :color, format: { with: /\A#(?:\h{3}){1,2}\z/, message: "must be hex color code" }
end
