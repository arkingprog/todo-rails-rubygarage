class TodoList < ActiveRecord::Base
  validates :title, length: {minimum: 3}, presence: true
  belongs_to :user

  has_many :todo_items
  accepts_nested_attributes_for :todo_items
end
