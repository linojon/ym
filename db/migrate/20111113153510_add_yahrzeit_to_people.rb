class AddYahrzeitToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :death_hebrew_day
      t.integer :death_hebrew_month
      t.integer :death_hebrew_year
      t.boolean :death_after_sunset
    end
  end
end
