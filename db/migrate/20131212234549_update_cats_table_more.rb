class UpdateCatsTableMore < ActiveRecord::Migration
  def change
    change_column :cats, :user_id, :integer, :null => false
    add_index :cats, :user_id
  end
end
