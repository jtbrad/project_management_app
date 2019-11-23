class Task < ApplicationRecord
  belongs_to :list

  def self.single_task(task_id)
    Task.find_by_sql(["
    SELECT *
    FROM tasks AS t
    WHERE t.id = ?
    ;", task_id]).first
  end

end
