class CreateForumPosts < ActiveRecord::Migration
  def self.up
    create_table :forum_posts do |t|
      t.string :body
      t.references :user, :forum_topic
      t.timestamps
    end
  end
 
  def self.down
    drop_table :forum_posts
  end
end
 
