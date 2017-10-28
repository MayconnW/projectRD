class Api::V1::DefaultApiController < ApplicationController
  protect_from_forgery with: :null_session
  
  def _response(status, data, message, status_request = :ok)
    respond_to do |format|
      msg = { :status => status, :data => data, :message => message }
      format.json  { render :json => msg, status: status_request }
    end
  end
 
  private
  
end