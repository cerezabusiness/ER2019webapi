class CreateMultimediaTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :multimedia_types do |t|
      t.string :multimedia_type

      t.timestamps
    end
  end
end
