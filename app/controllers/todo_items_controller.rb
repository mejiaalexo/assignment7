class TodoItemsController < ApplicationController

  before_action :set_list

  def show
    @item = @list.todo_items.find(params[:id])
  end

  def new 
    @item = @list.todo_items.new
  end 

  def edit 
    @item = @list.todo_items.find(params[:id]) 
  end

  def create 
  	@item = @list.todo_items.new(items_params)
  	if @item.save
  		redirect_to @list, notice: "Item Successfully Added!"
  	else
  		redirect_to @list, alert: "Unable to Add Item!"
  	end
  end

  def destroy 
  	@item = @list.todo_items.find(params[:id])
  	@item.destroy
  	redirect_to @list, notice: "Item was removed!"
  end

    def update
      @item = @list.todo_items.find(params[:id])
      respond_to do |format|
      if @item.update(items_params)
        format.html { redirect_to @list, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    def set_list
	  @list = current_user.todo_lists.find(params[:todo_list_id])
	end
	def items_params
	  params.require(:todo_item).permit(:due_date ,:task_title, :description,:done)
	end
end
