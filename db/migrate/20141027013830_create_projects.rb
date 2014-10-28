class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :kind
      t.string :url
      t.string :picture
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
