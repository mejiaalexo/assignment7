module TodoListsHelper

  def  self.isComplete (todo_list)
    $complete = true

    todo_list.todo_items.each do |item|
      if !item.done?
      	$complete = item.done?
      	break
      end
    end
  end 
end