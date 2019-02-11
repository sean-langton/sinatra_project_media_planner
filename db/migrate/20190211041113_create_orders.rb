class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :order_name
      t.float   :order_budget
      t.integer :channel_id
    end
  end
end
