class RemoveDescriptionColumnToTodoLists < ActiveRecord::Migration
  def change
    remove_column :todo_lists, :description, :text
  end
end
