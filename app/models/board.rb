class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  def self.single_board(board_id)
    Board.find_by_sql(["
    SELECT *
    FROM boards AS b
    WHERE b.id = ?
    ;", board_id]).first
  end

  def self.user_boards(user_id)
    Board.find_by_sql(["
    SELECT *
    FROM boards As b
    WHERE b.user_id = ?
    ;", user_id])
  end

end
