class CreateEventDates < ActiveRecord::Migration[5.2]
  def change
    create_table :event_dates do |t|
      t.date :date
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
