User.create(username: "jbonham", email: "johnbonham@gmail.com", password: "johnbonhamrocks")
Plan.create(plan_name:"Media Plan 1", plan_budget:"100000")
Channel.create(channel_name:"Channel 1", channel_budget:"100000")
Channel.create(channel_name:"Channel 2", channel_budget:"50000")

User.last.plans << Plan.last
Plan.last.channels << Channel.find(1)
Plan.last.channels << Channel.find(2)
