class AddCurrentToResumeItems < ActiveRecord::Migration
  def change
    change_table :resume_items do |t|
      t.boolean :current
    end
  end
end
