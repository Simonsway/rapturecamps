class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
    end
    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
    
    u = User.new :login => "admin", :password => "pswd", :password_confirmation => "pswd", :email => "admin@admin.com", :name => "admin"
    u.save(false)
  end

  def self.down
    drop_table "users"
  end
end
