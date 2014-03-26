class AddImageUrlToCat < ActiveRecord::Migration
  def change
    add_column :cats, :url, :string
  end
end
