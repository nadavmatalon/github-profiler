class AddLinkToGitlink < ActiveRecord::Migration
  def change
    add_column :gitlinks, :link, :string
  end
end
