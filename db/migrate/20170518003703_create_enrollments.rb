class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.string :voucher
      t.boolean :valid, default: false

      t.timestamps
    end
  end
end
