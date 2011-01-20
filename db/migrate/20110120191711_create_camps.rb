class CreateCamps < ActiveRecord::Migration
  def self.up
    create_table :camps do |t|
      t.string :name

      t.timestamps
    end
    
    c = Camp.new :name => "Portugal"
    c.save
    c = Camp.new :name => "Bali"
    c.save
  end

  def self.down
    drop_table :camps
  end
end
