class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :date_from_options
  
  def date_from_options(which)
    return Time.new if which.nil?
    part = Proc.new { |n| which["(#{n}i)"] }
    if part[1]
      Time.mktime(part[1].to_i, part[2].to_i, part[3].to_i)
    else
      Time.new
    end
  end
  
end