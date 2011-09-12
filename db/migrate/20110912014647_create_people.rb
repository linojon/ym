class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :maiden
      t.string :prefix
      t.string :suffix
      t.string :gender
      t.date :birthdate
      t.date :deathdate

      t.timestamps
    end
  end
end
