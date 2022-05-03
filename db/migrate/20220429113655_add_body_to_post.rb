class AddBodyToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts do |t|, :body, :text
      t.text :body
  end
end
