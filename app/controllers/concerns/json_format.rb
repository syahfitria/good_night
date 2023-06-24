module JsonFormat
  extend ActiveSupport::Concern

  included do
    def render_json(msg = "OK", code: :ok, data: {})
      render status: code, json: {
        msg: msg, 
        data: data
      }
    end
  end
end