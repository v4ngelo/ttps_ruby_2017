class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :course_id
      t.string :name
      t.string :surname
      t.string :dni
      t.string :student_number
      t.string :email

      t.timestamps
    end
    add_index :students, :course_id
  end
end
