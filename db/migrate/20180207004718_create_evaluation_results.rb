class CreateEvaluationResults < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_results do |t|
      t.references :student, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.integer :note

      t.timestamps
    end
  end
end
