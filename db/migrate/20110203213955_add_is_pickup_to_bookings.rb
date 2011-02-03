class AddIsPickupToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :is_pickup, :boolean, :default => true
  end

  def self.down
    remove_column :bookings, :is_pickup
  end
end
