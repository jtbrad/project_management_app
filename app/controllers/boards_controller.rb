class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.user_boards(current_user.id)
  end

  def show
    @lists = @board.lists
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

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

    def set_board
      @board = Board.single_board(params[:id])
    end

    def board_params
      params.require(:board).permit(:title)
    end

end
