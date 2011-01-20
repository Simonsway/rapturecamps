class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :camp
  
  validates :room, :presence => true
  validates :text, :presence => true
  validates :flight, :presence => true
  validates :customer_id, :presence => true
  validates :camp_id, :presence => true
  
  validates_associated :customer
  validates_associated :camp
  
protected
  
  def validate
    if arrival >= departure
      errors.add(:arrival, " and departure dates seems that invalid")
    end
  end
  
end