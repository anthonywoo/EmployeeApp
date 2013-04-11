class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.references :supervisor

      t.timestamps
    end
    add_index :employees, :supervisor_id
  end
end
