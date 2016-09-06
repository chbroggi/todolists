# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create! [
  { username: "Fiorina", password_digest: '123'},
  { username: "Trump", password_digest: '123'},
  { username: "Carson", password_digest: '123'},
  { username: "Clinton", password_digest: '123'},
]

Profile.destroy_all
Profile.create! [
  {first_name: "Carly", last_name: "Fiorina", gender: "female", birth_year:1954, user_id: User.find_by(username: "Fiorina").id },
  {first_name: "Donald", last_name: "Trump", gender: "male", birth_year:1946, user_id: User.find_by(username: "Trump").id },
  {first_name: "Ben", last_name: "Carson", gender: "male", birth_year:1951, user_id: User.find_by(username: "Carson").id },
  {first_name: "Hillary", last_name: "Clinton", gender: "female", birth_year:1947, user_id: User.find_by(username: "Clinton").id },
]

TodoList.destroy_all
User.all.each do  |u|
  TodoList.create( {user:u, list_name: "My list", list_due_date: Date.today+1.year } )
end

TodoItem.destroy_all
TodoList.all.each do  |tl|
  tl.todo_items.create! [
    {todo_list: tl, title: "Task 1", due_date: Date.today+1.year, description: "This is task 1", completed: false },
    {todo_list: tl, title: "Task 2", due_date: Date.today+1.year, description: "This is task 2", completed: true},
    {todo_list: tl, title: "Task 3", due_date: Date.today+1.year, description: "This is task 3", completed: false},
    {todo_list: tl, title: "Task 4", due_date: Date.today+1.year, description: "This is task 4", completed: true},
    {todo_list: tl, title: "Task 5", due_date: Date.today+1.year, description: "This is task 5", completed: false},
  ]
end