class PopulatePostCommentsCounter < ActiveRecord::Migration[7.2]
  def change
   Post.all.each do |post|
    Post.reset_counters(post.id, :comments)
   end
  end
end
