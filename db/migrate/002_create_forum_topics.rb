class CreateForumTopics < ActiveRecord::Migration
  def self.up
    create_table :forum_topics do |t|
      t.string :title
      t.references :forum, :user
    end
  end
 
  def self.down
    drop_table :forum_topics
  end
end
 
