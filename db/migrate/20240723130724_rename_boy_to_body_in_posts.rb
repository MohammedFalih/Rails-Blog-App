class RenameBoyToBodyInPosts < ActiveRecord::Migration[7.2]
  def change
    rename_column :posts, :boy, :body
  end
end
