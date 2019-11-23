class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.single_list(list_id)
    List.find_by_sql(["
    SELECT *
    FROM lists AS l
    WHERE l.id = ?
    ;", list_id]).first
  end

  def self.board_lists(board_id, list_id)
    List.find_by_sql(["
    SELECT *
    FROM lists AS l
    WHERE l.id = ? AND l.board_id = ?
    ;", list_id, board_id])
  end

end
