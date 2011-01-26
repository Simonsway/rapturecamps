class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  protect_from_forgery
  
  helper_method :date_from_options
  
  before_filter :login_required
  
  def date_from_options(which)
    return Time.new if which.nil?
    part = Proc.new { |n| which["(#{n}i)"] }
    if part[1]
      Time.mktime(part[1].to_i, part[2].to_i, part[3].to_i)
    else
      Time.new
    end
  end
  
protected
  
  def authorized?
    return true if params[:controller] == "sessions"
    logged_in?
  end
  
end