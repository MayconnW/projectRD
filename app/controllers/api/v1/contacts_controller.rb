class Api::V1::ContactsController < Api::V1::DefaultApiController
  
  def create
    validate = validate_param_to_create
    if validate != ""
      _response('error', {}, validate, :bad_request)
    else
      @contact = Contact.new(contact_params)
      if @contact.valid?
        @contact.save
        _response('success', default_columns_contact_json(@contact), "Contact created with success", :created)
      else
        message = @contact.errors.full_messages.uniq.join(" | ")
        _response('error', {}, message, :unprocessable_entity)
      end
    end
  end
  
  def track
    validate = validate_param_to_track
    if validate != ""
      _response('error', {}, validate, :bad_request)
    else
      @track = Track.new(track_params)
      if @track.valid?
        @track.save
        _response('success', default_columns_track_json(@track), "Track created with success", :created)
      else
        message = @track.errors.full_messages.uniq.join(" | ")
        _response('error', {}, message, :unprocessable_entity)
      end
    end
  end
  
  private
  
    def contact_params
      params.permit(:email, :cookie)
    end
    
    def track_params
      params.permit(:cookie, :url)
    end
    
    def default_columns_contact_json(contact)
      contact.as_json(
        :only => [ :id, :email, :cookie, :created_at, :updated_at ]
      )
    end
    
    def default_columns_track_json(track)
      track.as_json(
        :only => [ :id, :cookie, :url, :created_at, :updated_at ]
      )
    end
    
    def validate_param_to_create
      return "Please inform the param email" if !params.has_key?(:email)
      return "Please inform the param cookie" if !params.has_key?(:cookie)
      return  ""
    end
    
    def validate_param_to_track
      return "Please inform the param cookie" if !params.has_key?(:cookie)
      return "Please inform the param url" if !params.has_key?(:url)
      return  ""
    end
  
end