class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string  :channel_name
      t.integer   :channel_budget
      t.integer :plan_id
    end
  end
end
