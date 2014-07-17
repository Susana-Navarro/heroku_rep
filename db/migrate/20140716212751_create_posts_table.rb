class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|  		
  		t.string :data
  		t.datetime :created_at
  		t.integer :user_id
  	end
  end
end
