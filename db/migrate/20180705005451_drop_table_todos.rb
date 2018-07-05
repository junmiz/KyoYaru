class DropTableTodos < ActiveRecord::Migration[5.2]
  def change
    drop_table :todos
  end
end
