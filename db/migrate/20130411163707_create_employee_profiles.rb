class CreateEmployeeProfiles < ActiveRecord::Migration
  def change
    create_table :employee_profiles do |t|
      t.string :ssn
      t.string :address
      t.references :employee

      t.timestamps
    end
    add_index :employee_profiles, :employee_id
  end
end
