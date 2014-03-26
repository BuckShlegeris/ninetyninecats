class FixThings < ActiveRecord::Migration
  def change
    rename_column :cats, :birth, :birth_date
    remove_column :cats, :age
  end
end
