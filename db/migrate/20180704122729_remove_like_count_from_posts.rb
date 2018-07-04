class RemoveLikeCountFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :like_count, :integer
  end
end
