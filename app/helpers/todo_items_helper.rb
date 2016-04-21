module TodoItemsHelper

  def  self.isComplete(todo_item)
  	todo_item.done?
  end 

  def self.FormButtonText(item)
  buttonText = ""
  	if item.id
  		buttonText = "Edit Item"
  	else
  		buttonText = "Add Item"
  	end
  end
 def self.complete?(todo_item)
 	complete = "Complete"
 	if !todo_item.done?
 		complete= "Incomplete"
 	end
 end

end
