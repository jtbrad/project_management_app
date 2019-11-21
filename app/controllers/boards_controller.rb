class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @board.update(board_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
    
  end

  private

    def set_board
      @board = current_user.boards.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title)
    end

end
