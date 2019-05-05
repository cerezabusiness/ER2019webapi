class CreateActivitiesPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_people do |t|
      t.references :activity, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
