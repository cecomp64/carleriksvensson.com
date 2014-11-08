class AddPrimaryImageToProject < ActiveRecord::Migration
  def up
    change_table :projects do |t|
      t.integer :primary_image_id
    end

    # Set all the default values
    Project.all.each do |p|
      p.primary_image_id = nil
    end

    change_table :images do |i|
      i.remove :primary
    end
  end
  def down
    change_table :projects do |t|
      t.remove :primary_image_id
    end

    change_table :images do |i|
      i.integer :primary
    end
  end
end
