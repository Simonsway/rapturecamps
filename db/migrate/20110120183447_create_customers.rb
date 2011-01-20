class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :postcode
      t.string :tel
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
