class Api::V1::ContactsController < Api::V1::DefaultApiController
  
  def create
    validate = validate_param_to_create
    if validate != ""
      _response('error', {}, validate, :bad_request)
    else
      @contact = Contact.new(contact_params)
      if @contact.valid?
        @contact.save
        _response('success', default_columns_json(@contact), "Contact created with success", :created)
      else
        message = @contact.errors.full_messages.uniq.join(" | ")
        _response('error', {}, message, :unprocessable_entity)
      end
    end
  end
  
  private
  
    def contact_params
      params.permit(:email, :cookie)
    end
    
    def default_columns_json(contact)
      contact.as_json(
        :only => [ :id, :email, :cookie, :created_at, :updated_at ]
      )
    end
    
    def validate_param_to_create
      return "Please inform the param email" if !params.has_key?(:email)
      return "Please inform the param cookie" if !params.has_key?(:cookie)
      return  ""
    end
  
end