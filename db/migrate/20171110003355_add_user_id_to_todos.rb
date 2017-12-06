class AddUserIdToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :user_id, :integer, :confirmed_at
  end
end
