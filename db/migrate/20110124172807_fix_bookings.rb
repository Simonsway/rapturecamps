class FixBookings < ActiveRecord::Migration
  def self.up
    change_column :bookings, :text, :text
    add_column :bookings, :ref, :string
  end

  def self.down
    change_column :bookings, :text, :string
    remove_column :bookings, :ref
  end
end
