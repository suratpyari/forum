class CreateForum < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name, :description
      t.timestamps
    end
  end
 
  def self.down
    drop_table :forums
  end
end
 
