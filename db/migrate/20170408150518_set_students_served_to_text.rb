class SetStudentsServedToText < ActiveRecord::Migration[5.0]
  def change
    execute <<-SQL
ALTER TABLE sites ALTER COLUMN students_served TYPE text;    
    SQL
  end
end
