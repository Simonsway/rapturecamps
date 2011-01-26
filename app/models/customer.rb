class Customer < ActiveRecord::Base
  has_many :bookings
  
  validates :name, :presence => true, :uniqueness => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :postcode, :presence => true
  validates :tel, :presence => true
  validates :email, :presence => true,
                    :length => {:minimum => 6, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  def self.for_select
    find(:all).collect{|u| [u.name, u.id]}
  end
  
  def self.filter_conditions(params)
    cond = []
    
    [:name, :address, :city, :country, :tel, :email].each do |key|
      unless params[key].blank?
        cond << "#{key.to_s} like '%%#{connection.quote_string(params[key])}%%'"
      end
    end
    
    {:conditions => cond.join(" and ")}
  end

end