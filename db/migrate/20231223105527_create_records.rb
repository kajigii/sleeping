class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :date,              null: false  # 日付を文字列として記録
      t.time :bedtime,           null: false  # 就寝時間
      t.time :wake_up_time,      null: false  # 起床時間
      t.integer :time_of_sleeping, null: false  # 睡眠時間（分単位など）
      t.timestamps
    end
  end
end
