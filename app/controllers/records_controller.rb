class RecordsController < ApplicationController
  def index
    get_week
    @record = Record.new
  end

  # 予定の保存
  def create
    @record = Record.new(record_params)
    redirect_to action: :index
  end

  private

  def record_params
    params.require(:record).permit(:date, :bedtime, :wake_up_time)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    records = Record.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_records = []
      records.each do |record|
        today_records.push(record) if record.date == @todays_date + x
      end
      wday_num = Date.today.wday
      if wday_num >= 7
        wday_num = wday_num -7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, records: today_records, wday: wdays[(@todays_date + x).wday]}
      @week_days.push(days)
    end

  end
end
