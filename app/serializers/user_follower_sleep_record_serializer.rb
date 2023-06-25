class UserFollowerSleepRecordSerializer
  include Singleton
  
  def serialize(sleep_records)
    sleep_records.map do |record|
      {
        id: record.id,
        user: record.user_follower.name,
        clocked_in: record.user_follower.sleep_records[0].start_time,
        clocked_out: record.user_follower.sleep_records[0].end_time,
        duration: record.user_follower.sleep_records[0].duration
      }
    end
  end
end