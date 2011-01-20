class Camp < ActiveRecord::Base
  validates :name, :presence => true
  
  def self.for_select
    find(:all).collect{|u| [u.name, u.id]}
  end
end
