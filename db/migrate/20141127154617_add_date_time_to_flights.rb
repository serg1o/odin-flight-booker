class AddDateTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :date, :datetime
  end
end
