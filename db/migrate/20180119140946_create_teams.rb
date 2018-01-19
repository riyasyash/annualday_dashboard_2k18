class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :colour
      t.integer :total_members
      t.integer :members_found
      t.integer :position

      t.timestamps
    end
  end
end
