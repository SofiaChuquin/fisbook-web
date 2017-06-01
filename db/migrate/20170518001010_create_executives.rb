class CreateExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :executives do |t|
      t.string :position
      t.references :people, index: true, foreign_key: true

      t.timestamps
    end
  end
end
