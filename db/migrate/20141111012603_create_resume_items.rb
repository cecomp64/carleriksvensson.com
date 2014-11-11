class CreateResumeItems < ActiveRecord::Migration
  def change
    create_table :resume_items do |t|
      t.string :job_title
      t.date :start
      t.date :end
      t.text :description
      t.string :location
      t.integer :resume_id

      t.timestamps
    end
  end
end
