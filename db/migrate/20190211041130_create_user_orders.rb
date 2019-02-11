class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_plans do |t|
      t.string  :user_id
      t.float   :plan_id
    end
  end
end
