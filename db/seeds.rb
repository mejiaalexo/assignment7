# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Tag.destroy_all


#Setting up some users
User.create [
  {login: "user1", password:"user1"},
  {login: "Tim", password:"abc123"},
  {login: "Matt", password:"abc123"}
]

#Setting up some accounts 
User.first.create_account gender:"male", age: 21, first_name: "Jon", last_name: "Jon"
user2 = User.find_by login: "Tim"
user2.create_account gender:"female", age: 25, first_name: "Timmy", last_name:"TimTim"
user3 = User.find_by login: "Matt"
user3.create_account gender:"N/A", age: 100, first_name:"Matt", last_name:"Dumpty"

#create a todo_list for user3
listName="Vacation in China"
listName2="Prepare for Vacation"

user3.todo_lists.create [
  {list_name: listName, list_due_date: Date.new(2016,4,29)},
  {list_name: listName2, list_due_date: Date.tomorrow}
]

10.times {|index| user3.todo_lists.create [{list_name: "Sample List #{index}", list_due_date: Date.new(2024,4,29)}]}

#Create several items for user3's todo_list
user3TodoList=user3.todo_lists.find_by list_name: listName

user3TodoList.todo_items.create [
 {due_date: Date.new(2016,4,15),task_title:"Stroll through the woods",description:"Take the path through the woods"},
 {due_date: Date.new(2016,4,10),task_title:"Pack",description:"Get the water and snacks for the trip into Backpack"},
 {due_date: Date.new(2016,4,20),task_title:"Take a selfie sitting on the Great Wall",description:"Self-explanatory"}
 
]

#Create tags for some items
sharedTag = Tag.create tag_name: "shared tag"
sharedTagDB = Tag.find_by tag_name: "shared tag"

list_item= user3TodoList.todo_items.find_by task_title:"Pack"
list_item2= user3TodoList.todo_items.find_by task_title:"Take a selfie sitting on the Great Wall"

list_item.tags.create [
  {tag_name:"tag1"},
  {tag_name:"tag2"}
]

#creating tags to be shared among the list_items
list_item.tags << sharedTagDB

list_item2.tags << sharedTagDB