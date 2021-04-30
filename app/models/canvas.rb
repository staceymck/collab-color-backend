class Canvas < ApplicationRecord
  has_many :paintings
  has_many :polygons
end
