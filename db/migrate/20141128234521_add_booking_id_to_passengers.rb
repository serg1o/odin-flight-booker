class AddBookingIdToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :booking_id, :integer
    add_index :passengers, :booking_id
  end
end
