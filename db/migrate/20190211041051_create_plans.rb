class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :plan_name
      t.float   :plan_budget
      t.date    :plan_start_date
      t.date    :plan_end_date
    end
  end
end
