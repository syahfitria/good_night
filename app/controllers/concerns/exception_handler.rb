module ExceptionHandler
  extend ActiveSupport::Concern
  include JsonFormat

  class RecordNotFound < StandardError; end
  class InvalidParamsError < StandardError; end
  class DuplicateRecordError < StandardError; end
  class InvalidRecordError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ExceptionHandler::InvalidParamsError, with: :invalid_params
    rescue_from ExceptionHandler::DuplicateRecordError, with: :duplicate_record
    rescue_from ExceptionHandler::InvalidRecordError, with: :invalid_record

    def not_found(exception)
      resource = exception.model
      render_json("#{resource} not found", code: :not_found)
    end

    def invalid_params
      render_json("Params are invalid", code: :bad_request)
    end

    def duplicate_record
      render_json("Duplicate record", code: :unprocessable_entity)
    end

    def invalid_record
      render_json("Invalid record", code: :unprocessable_entity)
    end
  end
end