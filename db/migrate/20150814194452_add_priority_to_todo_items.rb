class AddPriorityToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :priority, :integer, default: 0
  end
end
