class SleepRecordsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    get_sleep_records = SleepRecord.all_clock
    data = SleepRecordSerializer.instance.serialize(get_sleep_records)
    render_json(data: data)
  end

  def create
    raise RecordNotFound unless User.find(params[:user_id]).present?
    
    if params[:clock_in].present? && params[:clock_out].present?
      raise DuplicateRecordError if SleepRecord.find_by(user_id: params[:user_id]).present?
      SleepRecord.create!(
        user_id: params[:user_id],
        start_time: params[:clock_in],
        end_time: params[:clock_out],
        duration: Time.parse(params[:clock_out]) - Time.parse(params[:clock_in])
      )
      render_json("Clock has been saved", code: :ok)
    else
      raise InvalidParamsError
    end

    rescue
      render_json("Error when save sleep record", code: :unprocessable_entity)
    
  end

end