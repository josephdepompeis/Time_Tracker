# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
developer1 = Developer.create!({first: 'Joseph', last: 'Jones', email: 'login@login.com', password: 'password'})
project1 = Project.create!({max_time_spent: 20, description: 'test project!'})
entries1 = Entry.create!({developer_id: developer1.id, date: Date.current, project_id: project1.id, duration: 10 })
