class ClaimResponsesController < ApplicationController

  def new
    @claim_response = ClaimResponse.new
  end

end
