class SleepRecordSerializer
  include Singleton
  
  def serialize(sleep_records)
    sleep_records.map do |record|
      {
        id: record.id,
        user: record.user.name,
        clocked_in: record.start_time,
        clocked_out: record.end_time
      }
    end
  end
end