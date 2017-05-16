class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :rank
      t.references :people, index: true, foreign_key: true

      t.timestamps
    end
  end
end
