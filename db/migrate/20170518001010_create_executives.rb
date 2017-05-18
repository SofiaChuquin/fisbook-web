class CreateExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :executives do |t|
      t.string :position

      t.timestamps
    end
  end
end
