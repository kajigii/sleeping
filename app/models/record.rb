class Record < ApplicationRecord
  validates :date, :bedtime, :wake_up_time, presence: true

  before_save :calculate_time_of_sleeping

  private

  def calculate_time_of_sleeping
    # 入力された bedtime と wake_up_time を分単位に変換
    bedtime_minutes = (bedtime.hour * 60) + bedtime.min
    wake_up_minutes = (wake_up_time.hour * 60) + wake_up_time.min
  
    # 入眠時間が12:00より後
    if bedtime_minutes > 12 * 60
      x = bedtime_minutes - 12 * 60
      y = wake_up_minutes + 12 * 60
      time_of_sleeping = y - x
    else
      x = bedtime_minutes + 12 * 60
      y = wake_up_minutes + 12 * 60
      time_of_sleeping = y - x
    end
  
    # 結果を返す
    time_of_sleeping
  end
end