class Painting < ApplicationRecord
  belongs_to :canvas
  has_many :colored_polygons
  accepts_nested_attributes_for :colored_polygons
  
  scope :newest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  scope :random, -> { order("RANDOM()")}

  def self.applySort(query)
    if query === "oldest"
      Painting.oldest
    elsif query === "random"
      Painting.random
    else
      Painting.newest
    end
  end
end
