class BookingsController < ApplicationController
  
  def index
    startdate = Date.today
    enddate = Date.today + 7
    incl = [:customer, :camp]
    @bookings_arrival = Booking.find(:all, :conditions => {:arrival => startdate..enddate}, :include => incl, :order => "arrival desc")
    @bookings_departure = Booking.find(:all, :conditions => {:departure => startdate..enddate}, :include => incl, :order => "departure desc")
  end
  
  def new
    @booking = Booking.new
  end
  
  def list
    @bookings = Booking.find(:all, Booking.filter_conditions(params))
  end
  
  def create
    @booking = Booking.new(params[:booking])
    if @booking.save(params[:booking])
     redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  def edit 
    @booking = Booking.find(params[:id])
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(params[:booking])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :action => :index
  end
  
  def auto_complete_belongs_to_for_booking_customer_name
    @customers = Customer.find(:all, Customer.filter_conditions(:name => params[:customer][:name]))
    render :inline => '<%= model_auto_completer_result(@customers, :name) %>'
  end
  
end