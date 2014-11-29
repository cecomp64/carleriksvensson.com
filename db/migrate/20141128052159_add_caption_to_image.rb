class AddCaptionToImage < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.text :caption
      t.integer :post_id
    end
  end
end
