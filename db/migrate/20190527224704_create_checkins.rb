class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.references :person, foreign_key: true
      t.references :event_date, foreign_key: true

      t.timestamps
    end
  end
end
