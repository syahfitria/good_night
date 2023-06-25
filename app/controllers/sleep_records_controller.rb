class SleepRecordsController < ApplicationController

  def index
    get_sleep_records = SleepRecord.all_clock
    data = SleepRecordSerializer.instance.serialize(get_sleep_records)
    render_json(data: data)
  end

end