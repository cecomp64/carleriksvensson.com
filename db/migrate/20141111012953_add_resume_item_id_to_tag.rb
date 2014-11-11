class AddResumeItemIdToTag < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.integer :resume_item_id
    end
  end
end
