class Evaluation < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :user

  validates_uniqueness_of :user, :scope => :candidate

  def total
    commitment + scholarship + recommendations + goals
  end
end
