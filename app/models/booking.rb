class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :camp
  
  validates :room, :presence => true
  validates :text, :presence => true
  #validates :flight, :presence => true
  validates :customer_id, :presence => true
  validates :camp_id, :presence => true
  
  validates_associated :customer
  validates_associated :camp
  
  # def customer_name
    # customer.name if customer
  # end

  # def customer_name=(name)
    # self.customer = Customer.find_by_name(name) unless name.blank?
  # end
  
  #http://railscasts.com/episodes/102-auto-complete-association
  
  def self.filter_conditions(params)
    cond = []
    include = []
    
    if !params[:name].blank? && params[:name] != "Name"
      cond << "customers.name like '%%#{connection.quote_string(params[:name])}%%'"
      include << :customer
    end
    
    [:room, :text, :ref, :flight].each do |key|
      if !params[key].blank? && params[key] != key.to_s.humanize
        cond << "#{key.to_s} like '%%#{connection.quote_string(params[key])}%%'"
      end
    end
    
    if params[:camp]
      camp_c = []
      params[:camp].each do |k, v|
        camp_c << "camp_id = #{k}"
      end
      cond << "(" + camp_c.join(" or ") + ")"
    end
    
    if params[:arrival] && params[:departure]
      a = date_from_options(params[:arrival])
      d = date_from_options(params[:departure])
      cond << " DATE(arrival) >= DATE('#{a.to_s(:db)}') and DATE(departure) <= DATE('#{d.to_s(:db)}')"
    end
    
    {:conditions => cond.join(" and "), :include => include}
  end
  
protected
  
  def self.date_from_options(which)
    return Time.new if which.nil?
    part = Proc.new { |n| which["(#{n}i)"] }
    if part[1]
      Time.mktime(part[1].to_i, part[2].to_i, part[3].to_i)
    else
      Time.new
    end
  end
  
  def validate
    if arrival >= departure
      errors.add(:arrival, " and departure dates seems that invalid")
    end
  end
  
end