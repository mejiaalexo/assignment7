class CreateTagsTodoItems < ActiveRecord::Migration
  def change
    create_table :tags_todo_items, id:false do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :todo_item, index: true, foreign_key: true
    end
  end
end
