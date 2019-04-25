class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.string :phone
      t.string :email
      t.string :city_id
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
