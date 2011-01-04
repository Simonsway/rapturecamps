class BookingsController < ApplicationController
  def index
    startdate = Date.today
    enddate = Date.today+7
    @bookings_arrival = Booking.find(:all, :conditions => {:arrival => startdate..enddate})
    @bookings_departure = Booking.find(:all, :conditions => {:departure => startdate..enddate})
  end
  def new
    @booking = Booking.new
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
end



#@bookings = Booking.find(:all, :conditions => {:arrival => })
#@bookings = Booking.find(:all, :order => "arrival asc")