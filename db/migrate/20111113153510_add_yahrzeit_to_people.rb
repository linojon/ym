class AddYahrzeitToPeople < ActiveRecord::Migration
  def change
    add_column :people, :death_hebrew_date_day, :integer
    add_column :people, :death_hebrew_date_month, :integer
    add_column :people, :death_hebrew_date_year, :integer
    add_column :people, :death_after_sunset, :boolean
  end
end
