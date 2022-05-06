class AddMissingNullChecks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :todos, :title, false
    change_column_null :todos, :body, false
    change_column_null :comments, :body, false
  end
end
