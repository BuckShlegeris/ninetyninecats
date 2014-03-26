class RemoveSexRequirement < ActiveRecord::Migration
  def change
    change_column :cats, :sex, :string, :null => true
  end
end
