class CustomersController < ApplicationController
  def index
    @objects = Customer.find(:all)
  end
  
  def new
    @object = Customer.new
  end
  
  def create
    @object = Customer.new(params[:customer])
    if @object.save(params[:customer])
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @object = Customer.find(params[:id])
  end
  
  def update
    @object = Customer.find(params[:id])
    if @object.update_attributes(params[:customer])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @object = Customer.find(params[:id])
    @object.destroy
    redirect_to :action => :index
  end
  
  def bookings
    @object = Customer.find(params[:id])
    @bookings = @object.bookings
  end
end