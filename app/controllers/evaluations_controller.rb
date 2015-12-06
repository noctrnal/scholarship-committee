class EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def create
    params['evaluations'].each do |evaluation|
      Evaluation.create(evaluation_params(evaluation))
    end

    redirect_to evaluations_url
  end

  def index
    @candidates = Candidate.all
    @evaluations = Evaluation.order(:candidate_id)
  end

  def new
    @evaluations = []
    @options = [1, 2, 3, 4, 5]

    Candidate.all.each do |candidate|
      @evaluations << Evaluation.new(
        :candidate => candidate,
        :user => current_user
      )
    end
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  private
    def evaluation_params(evaluation)
      evaluation.permit(
        :candidate_id,
        :commitment,
        :scholarship,
        :recommendations,
        :goals,
        :remarks,
        :user_id
      )
    end
end
