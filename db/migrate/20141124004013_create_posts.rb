class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.text :title
      t.date :posted_on
      t.boolean :published
      t.int :user_id

      t.timestamps
    end
  end
end
