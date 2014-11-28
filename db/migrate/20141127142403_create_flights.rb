class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :to_airport_id
      t.integer :from_airport_id

      t.timestamps
    end
    add_index :flights, :from_airport_id
    add_index :flights, :to_airport_id
  end
end
