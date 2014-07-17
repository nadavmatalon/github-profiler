class CreateGitlinks < ActiveRecord::Migration
  def change
    create_table :gitlinks do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
