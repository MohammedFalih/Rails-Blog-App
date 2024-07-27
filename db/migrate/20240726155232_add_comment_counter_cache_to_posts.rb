class AddCommentCounterCacheToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :comments_count, :integer
  end
end
