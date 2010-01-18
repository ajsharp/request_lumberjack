require 'dm-core'
require 'dm-validations'
require 'dm-types'

module RequestLumberjack
  
  class LoggedResponse
    include DataMapper::Resource

    property :id,             Serial
    property :request_uri,    String,  :required => true
    property :status,         Integer, :required => true
    property :request_method, String,  :required => true
    property :extra_fields,   Json

    timestamps :created_at

  end

end
