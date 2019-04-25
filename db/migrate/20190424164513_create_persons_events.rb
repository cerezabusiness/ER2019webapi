class CreatePersonsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :persons_events do |t|
      t.references :person, foreign_key: true
      t.references :event, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
