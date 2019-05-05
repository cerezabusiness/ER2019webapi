class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.time :start_time
      t.time :end_time
      t.references :event_date, foreign_key: true
      t.references :places_event, foreign_key: true

      t.timestamps
    end
  end
end
