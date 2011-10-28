class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :activity_id
      t.float :grade

      t.timestamps
    end
  end
end
