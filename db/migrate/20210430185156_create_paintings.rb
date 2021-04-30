class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.belongs_to :canvas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
