class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :date
      t.references :time_range, index: {:unique=>true}, foreign_key: true
      t.references :places_event, foreign_key: true

      t.timestamps
    end
  end
end
