class ChangeStatusToTextInTasks < ActiveRecord::Migration[8.0]
  def change
    change_column :tasks, :status, :string
  end
end
