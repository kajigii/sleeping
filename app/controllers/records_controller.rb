class RecordsController < ApplicationController
  def index
    @records = Record.order(created_at: :desc).limit(7)
    @record = Record.new
    # 各レコードに対して time_of_sleeping を計算してセット
    @records.each do |record|
      record.instance_variable_set(:@time_of_sleeping, calculate_time_of_sleeping(record.bedtime, record.wake_up_time))
    end
  end

  def create
    # フォームから送信されたデータを使って新しいRecordオブジェクトを作成
    @record = Record.new(record_params)

    if @record.save
      # レコード保存成功時に time_of_sleeping を計算してセット
      @record.time_of_sleeping = calculate_time_of_sleeping(@record.bedtime, @record.wake_up_time)
      # @record.save # 更新内容を保存
      oldest_data = Record.order(created_at: :asc).first
    else
      # 保存が成功した場合は、再度全てのレコードを取得し直す
      @records = Record.all
      render :index
    end

  end

  def show
    @record = Record.find(params[:date])
  end

  private

  def record_params
    params.require(:record).permit(:date, :bedtime, :wake_up_time)
  end

  def calculate_time_of_sleeping(bedtime, wake_up_time)
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