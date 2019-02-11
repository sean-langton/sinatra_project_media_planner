class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string  :channel_name
      t.float   :channel_budget
      t.date    :channel_start_date
      t.date    :channel_end_date
    end
  end
end
