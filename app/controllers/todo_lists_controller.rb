class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  before_action :current_todo_list, only: [:show]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.where("user_id = ?",current_user.id)

  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
    @todo_list.todo_items.build

  end

  # GET /todo_lists/1/edit
  def edit
    @todo_list.todo_items.build
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user_id=current_user.id

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list}
        format.json { render :show, status: :created, location: @todo_list }
        format.js
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    @todo_id=@todo_list.id
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        @todo_lists = TodoList.where("user_id = ?",current_user.id)
        format.html { redirect_to @todo_list}
        format.json { render :show, status: :ok, location: @todo_list }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.todo_items.each do |todo_item|
      todo_item.destroy
    end
    @todo_list_id=@todo_list.id
    @todo_list.destroy
    @todo_lists = TodoList.where("user_id = ?",current_user.id)
    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description, todo_items_attributes: [:content])
    end

    def current_todo_list
      if @todo_list.user_id != current_user.id
        redirect_to root_url
      end
    end
end
