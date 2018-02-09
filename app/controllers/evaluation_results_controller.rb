class EvaluationResultsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_evaluation_result, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_results
  # GET /evaluation_results.json
  def index
    @evaluation_results = EvaluationResult.includes(:evaluation).all.order('evaluations.evaluation_date')
  end

  # GET /evaluation_results/1/edit
  def edit
    @students = Student.all.uniq
  end

  # POST /evaluation_results
  # POST /evaluation_results.json
  def create
    @evaluation_result = EvaluationResult.new(evaluation_result_params)
    respond_to do |format|
      if @evaluation_result.save
        format.html { redirect_to action: "index", notice: 'Se creó la nota exitosamente.' }
      else
        format.html { render :new }
        format.json { render json: @evaluation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_results/1
  # PATCH/PUT /evaluation_results/1.json
  def update
    @students = Student.all
    respond_to do |format|
      if @evaluation_result.update(evaluation_result_params)
        format.html { redirect_to action: "index", notice: 'Se actualizó la nota exitosamente.' }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_results/1
  # DELETE /evaluation_results/1.json
  def destroy
    @evaluation_result.destroy
    respond_to do |format|
      format.html { redirect_to evaluation_results_url, notice: 'Evaluation result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation_result
    @evaluation_result = EvaluationResult.find(params[:id])
  end

  def evaluation_result_params
    params.require(:evaluation_result).permit(:course_id, :student_id, :evaluation_id, :note)
  end
end
