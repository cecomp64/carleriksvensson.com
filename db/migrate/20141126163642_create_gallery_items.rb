class CreateGalleryItems < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.string :title
      t.text :description
      t.integer :gallery_id
      t.boolean :cover

      t.timestamps
    end
  end
end
