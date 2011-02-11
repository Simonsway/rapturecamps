class Customer < ActiveRecord::Base
  has_many :bookings
  
  validates :name, :presence => true, :uniqueness => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :postcode, :presence => true
  validates :tel, :presence => true
  
  def self.for_select
    find(:all).collect{|u| [u.name, u.id]}
  end
  
  def self.filter_conditions(params)
    cond = []
    
    [:name, :address, :city, :country, :tel, :email].each do |key|
      if !params[key].blank? && params[key] != key.to_s.humanize
        cond << "#{key.to_s} like '%%#{connection.quote_string(params[key])}%%'"
      end
    end
    
    {:conditions => cond.join(" and ")}
  end

end