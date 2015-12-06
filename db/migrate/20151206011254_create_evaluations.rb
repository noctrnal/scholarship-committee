class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :candidate_id
      t.integer :commitment
      t.integer :scholarship
      t.integer :recommendations
      t.integer :goals
      t.string :remarks

      t.timestamps null: false
    end
  end
end
