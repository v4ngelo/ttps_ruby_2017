class EvaluationResultsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_evaluation_result, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_results
  # GET /evaluation_results.json
  def index
    if params.has_key?(:course)
      @evaluation_results = EvaluationResult.by_course_by_evaluation_date(params[:course][:course_id])
    else
      @evaluation_results = EvaluationResult.order_by_evaluation_date;
    end

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
        format.json { respond_with_bip(@evaluation_result) }
      else
        format.html { render :action => "index" }
        format.json { respond_with_bip(@evaluation_result) }
      end
    end
  end

  # DELETE /evaluation_results/1
  # DELETE /evaluation_results/1.json
  def destroy
    if @evaluation_result.destroy
      flash['success'] = "Resultado eliminado correctamente."
      redirect_to action: "index"
    else
      flash['error'] = "El resultado no pudo ser eliminado."
      redirect_to evaluation_result_path
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
