class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(:all)
    #@bookings = Booking.find_all_by_customer_id (3)
  end
  def new
    @bookings = Booking.new
  end
  def create
    @bookings = Booking.new(params[:booking])
  end
  def show
    @bookings = Booking.find(params[:id])
  end
  def edit 
    @bookings = Booking.find(params[:id])
  end
  def update
    @bookings = Booking.find(params[:id])
  end
end