class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :github_id, :integer
  end
end
