class CreateMultimedia < ActiveRecord::Migration[5.2]
  def change
    create_table :multimedia do |t|
      t.string :name
      t.string :url
      t.references :multimedia_type, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
