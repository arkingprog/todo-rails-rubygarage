class TodoList < ActiveRecord::Base
  belongs_to :user

  has_many :todo_items
  accepts_nested_attributes_for :todo_items
end
