class CreatePolygons < ActiveRecord::Migration[6.0]
  def change
    create_table :polygons do |t|
      t.belongs_to :canvas, null: false, foreign_key: true
      t.string :points, null: false

      t.timestamps
    end
  end
end
