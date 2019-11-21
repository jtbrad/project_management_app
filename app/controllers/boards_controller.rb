class BoardsController < ApplicationController

  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create(params.require(:board).permit(:title))

    if @board.save
      redirect_to boards_path
    else
      render :new
    end

  end

  def edit
  end
end
