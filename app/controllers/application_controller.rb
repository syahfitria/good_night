class ApplicationController < ActionController::Base
  include JsonFormat
  include ExceptionHandler
end
