class CreateCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :cycles do |t|
      t.string :name
      t.string :semester, limit: 1
      t.integer :year, limit: 4

      t.timestamps
    end
  end
end
