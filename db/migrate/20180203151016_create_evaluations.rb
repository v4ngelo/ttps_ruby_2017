class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :course_id
      t.string :title
      t.date :evaluation_date
      t.integer :minimum_note

      t.timestamps
    end
    add_index :evaluations, :course_id
  end
end
