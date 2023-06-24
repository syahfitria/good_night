class SleepRecordsController < ApplicationController

  def index
    get_sleep_records = SleepRecord.all_clock
    
    render_json(get_sleep_records)
  end

end