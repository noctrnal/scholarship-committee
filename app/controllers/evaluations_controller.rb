class EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @evaluation = Evaluation.where(
      'candidate_id' => params[:evaluation][:candidate_id],
      'user_id' => current_user.id
    )

    if !@evaluation
      @evaluation = Evaluation.new(evaluation_params)
      @evaluation.user = current_user
      @evaluation.save
      redirect_to evaluations_path
    end

    redirect_to evaluations_path
  end

  def index
    @candidates = Candidate.all
    @evaluations = Evaluation.order(:candidate_id).where(:user => current_user)
  end

  def new
    @evaluation = Evaluation.new
    @options = [1, 2, 3, 4, 5]
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(
        :candidate_id,
        :commitment,
        :scholarship,
        :recommendations,
        :goals,
        :remarks,
      )
    end
end
