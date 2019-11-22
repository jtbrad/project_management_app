class TasksController < ApplicationController
  before_action :set_list
  before_action :set_board
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to board_path(@board)
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @task.update(task_params)
      redirect_to board_path(@board)
    else
      render :edit
    end

  end

  def destroy
    @task.destroy
    redirect_to board_path(@board)
  end

  private

    def set_board
      @board = Board.find(@list.board_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = @list.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :priority)
    end

end
