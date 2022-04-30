class AddTodopostToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :todopost, :text
  end
end
