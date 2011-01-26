class UsersController < ApplicationController

  def index
    @users = User.find(:all)
  end
  
  def new
    @user = User.new
  end
  
  def create
    #logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      # self.current_user = @user # !! now logged in
      # redirect_back_or_default('/', :notice => "Thanks for signing up! We're sending you an email with your activation code.")
      redirect_to :action => :index
    else
      #flash.now[:error]  = "We couldn't set up that account, sorry. Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end
  
end
