class ListsController < ApplicationController
  before_action :set_board

  def index
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_path(@board)
    else
      render :new
    end

  end

  def edit
  end

  private

    def set_board
      @board = current_user.boards.find(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:title, :priority, :board_id)
    end

end
