class Candidate < ActiveRecord::Base
  has_many :evaluations, dependent: :destroy

  def commitment_total
    Evaluation.select('sum(commitment) as commitment')
      .where(:candidate_id => id)[0]['commitment'].to_i
  end

  def goals_total
    Evaluation.select('sum(goals) as goals')
      .where(:candidate_id => id)[0]['goals'].to_i
  end

  def recommendations_total
    Evaluation.select('sum(recommendations) as recommendations')
      .where(:candidate_id => id)[0]['recommendations'].to_i
  end

  def scholarship_total
    Evaluation.select('sum(scholarship) as scholarship')
      .where(:candidate_id => id)[0]['scholarship'].to_i
  end

  def total
    commitment_total + goals_total + recommendations_total + scholarship_total
  end
end
