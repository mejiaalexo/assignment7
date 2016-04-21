require_relative '../config/environment'

class Formatter
  def self.nl
  	puts " "
  end
end


# Need to show that 4,5, and 6 are working.
#--------------------------------------------------------------------------------------------
# 4. Mapping todoItems directly on the user model:  access the todo_items from the user directly
puts "Direct Mapping of todo_items to user (user3):"
user3 = User.find_by login:"user3";

$i=0;
user3.items_todo.pluck(:task_title).to_a.each do |title|
  $i+=1
  puts "\t#{$i}. #{title}"
end
Formatter.nl
#--------------------------------------------------------------------------------------------
#5 Validation of the Account model
#5a. Validate that the gender field only accepts 'male','female','N/A'
#5b. Validate age field only accepts values between 20 and 100 (inclusive)
puts "Creating an account with invalid gender: 'person1' and age 19:"
account = Account.create gender:"person1",age: 19,first_name:"Katie",last_name:"Marie"

account.errors.full_messages.each do |messages|
  puts "\t #{messages}"
end
Formatter.nl
#--------------------------------------------------------------------------------------------
puts "Default Scope for todo lists (user3):"
#6a. default scope 
$i=0
user3.todo_lists.to_a.each do |list|
  $i+=1
  puts "\t#{$i}\. title: #{list.list_name} due date: #{list.list_due_date}"
end
Formatter.nl
puts "Default Scope for todo lists (user3):"
$i=0
#6b. default scope 
user3.items_todo.to_a.each do |item|
  $i+=1
  puts "\t#{$i}. task: #{item.task_title} due date: #{item.due_date}"
end
Formatter.nl
#--------------------------------------------------------------------------------------------

# Also demonstrate all the basic relationships between all the other models. 

#User model and account 
#--------------------------------------------------------------------------------------------
puts "User2 relationship with account:"
user2= User.find_by login:"user2"
$user2_account=user2.account

puts "User2 name: #{$user2_account.first_name} #{$user2_account.last_name} #{$user2_account.age} yrs. old." 

Formatter.nl
#--------------------------------------------------------------------------------------------

#User model and todo_list
#--------------------------------------------------------------------------------------------
puts "User model and todo_list:"

user3.todo_lists.to_a.each do |list|
	puts "\t#{list.list_name}"
end

Formatter.nl
#--------------------------------------------------------------------------------------------


#Todo_list model and todo_items model
#--------------------------------------------------------------------------------------------
puts "Get todo_items from the todo_list:"

todo_list = user3.todo_lists.find_by list_name:"Vacation in China"
todo_list.todo_items.pluck(:task_title).to_a.each do |item_title|
  puts "\t#{item_title}"
end

Formatter.nl
#--------------------------------------------------------------------------------------------

#Todo_items model and tags model 
#--------------------------------------------------------------------------------------------
puts "Get items by the sharedTag:"
sharedTag= Tag.find_by tag_name:"shared tag"

sharedTag.todo_items.each do |item|
  puts "\ttitle: #{item.task_title} tags: #{item.tags.pluck(:tag_name).to_a}"
end
#--------------------------------------------------------------------------------------------
