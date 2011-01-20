class UpdateBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :camp_id, :integer
    remove_column :bookings, :customer_name
  end

  def self.down
    add_column :bookings, :customer_name, :string
    remove_column :bookings, :camp_id
  end
end
