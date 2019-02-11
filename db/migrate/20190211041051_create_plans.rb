class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :plan_name
      t.float   :plan_budget
    end
  end
end
