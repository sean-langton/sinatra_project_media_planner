User.create(full_name: "john bonham", email: "johnbonham@gmail.com", password: "johnbonhamrocks")
Plan.create(plan_name:"Media Plan 1", plan_budget:"100000")
Channel.create(channel_name:"Channel 1", channel_budget:"100000")
Order.create(order_name:"Order 1", order_budget:"100000")

User.last.plans << Plan.last
Plan.last.channels << Channel.last
Channel.last.orders << Order.last
