class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :order_name
      t.float   :order_budget
      t.date    :order_start_date
      t.date    :order_end_date
    end
  end
end
