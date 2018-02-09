class AddStatusToEvaluationResult < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluation_results, :status, :string
  end
end
