class TasksController < ApplicationController
  before_action :set_list
  before_action :set_board

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(params.require(:task).permit(:title, :priority))

    if @task.save
      redirect_to board_path(@board)
    else
      render :new
    end

  end

  def edit
  end

  private

    def set_board
      @board = Board.find(@list.board_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end

end
