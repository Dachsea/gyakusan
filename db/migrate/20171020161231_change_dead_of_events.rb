class ChangeDeadOfEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :dead, :date
  end
end
