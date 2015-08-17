class TodoItemsController < ApplicationController
  before_action :set_todo_list,:set_todo_lists
  before_action :set_todo_item,except: [:create]
  def create
    @todo_item=@todo_list.todo_items.create(todo_item_params)
    respond_to do |format|
      format.html{redirect_to @todo_list,@todo_item}
      format.js
    end
  end

  def complete
    @todo_item.update_attribute(:completed_at,Time.now)
    respond_to do |format|
      format.html{ redirect_to @todo_list}
      format.js
    end
  end
  def priority
    if @todo_item.priority==0
    @todo_item.update_attribute(:priority,1)
    else
      @todo_item.update_attribute(:priority,0)
    end
    respond_to do |format|
      format.html{ redirect_to @todo_list}
      format.js
    end
  end
  def destroy
    @todo_item=@todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success]="Todo list item was deleted. "
    else
      flash[:error]="Todo list item could not be deleted."
    end
    respond_to do |format|
      format.html{ redirect_to @todo_list}
      format.js
    end
  end


  private

  def set_todo_lists
    @todo_lists = TodoList.where("user_id = ?",current_user.id)
  end
  def set_todo_list
    @todo_list=TodoList.find(params[:todo_list_id])
  end
  def set_todo_item
    @todo_item=@todo_list.todo_items.find(params[:id])

  end
  def todo_item_params
    params[:todo_item].permit(:content,:deadline)
  end
end
