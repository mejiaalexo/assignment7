class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_and_belongs_to_many :tags
  before_destroy {tags.clear}

  default_scope {order due_date: :asc }
end
