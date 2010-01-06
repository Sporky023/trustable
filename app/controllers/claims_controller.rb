class ClaimsController < ApplicationController
  
  layout 'application'
  
  def index
    @claims = Claim.all
  end
  
  def new
    @claim = Claim.new
  end
  
  def create
    @claim = Claim.new(params[:claim])
    if @claim.save
      redirect_to claims_path
    else
      flash[:error] = "You had some information missing in your claim"
      render :action => 'new'
    end
  end
  
  def show
    @claim = Claim.find(params[:id])
  end
  
end
