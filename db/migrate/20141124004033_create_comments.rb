class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.text :author_url
      t.string :author
      t.integer :post_id

      t.timestamps
    end
  end
end
