class AddColumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, :default => "", :null => true
    add_column :users, :url, :string, :default => "", :null => true
  end
end
