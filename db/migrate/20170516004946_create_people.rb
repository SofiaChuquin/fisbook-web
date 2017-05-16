class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :lastname
      t.string :name
      t.string :dni, limit: 8
      t.string :phone, limit: 9
      t.string :email
      t.string :gender
      t.string :state
      t.string :rol

      t.timestamps
    end
  end
end
