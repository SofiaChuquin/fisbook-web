class AddPeopleToExecutives < ActiveRecord::Migration[5.0]
  def change
    add_reference :executives, :people, index: true, foreign_key: true
  end
end
