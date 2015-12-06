class AddUserToEvaluations < ActiveRecord::Migration
  def change
    add_reference :evaluations, :user, index: true, foreign_key: true
  end
end
