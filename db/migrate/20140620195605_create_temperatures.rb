class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.date :calendar_date
      t.decimal :daily_max
      t.decimal :daily_min
      t.boolean :are_valid

      t.timestamps
    end
  end
end
