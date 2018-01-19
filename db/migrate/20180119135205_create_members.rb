class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :employee_id
      t.integer :ref_employee
      t.string :code
      t.integer :attempts
      t.boolean :is_identified

      t.timestamps
    end
  end
end
