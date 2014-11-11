class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :title
      t.text :objective

      t.timestamps
    end
  end
end
