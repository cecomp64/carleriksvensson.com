class AddInstitutionToResumeItem < ActiveRecord::Migration
  def change
    change_table :resume_items do |t|
      t.text :institution
    end
  end
end
