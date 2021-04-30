class CreateColoredPolygons < ActiveRecord::Migration[6.0]
  def change
    create_table :colored_polygons do |t|
      t.belongs_to :painting, null: false, foreign_key: true
      t.belongs_to :polygon, null: false, foreign_key: true
      t.string :color

      t.timestamps
    end
  end
end
