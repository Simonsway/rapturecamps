class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :customer_id
      t.string :customer_name
      t.string :room
      t.string :text
      t.date :arrival
      t.date :departure
      t.datetime :pickup

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
