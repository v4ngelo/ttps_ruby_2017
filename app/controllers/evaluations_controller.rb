class EvaluationsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  def index
    if params.has_key?(:course)
      @evaluations = Evaluation.where(course_id: params[:course][:course_id])
    else
      @evaluations = Evaluation.all
    end
  end

  # GET /evaluations/new
  def new
    @courses = Course.all
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
    @courses = Course.all
    @evaluation = Evaluation.find(params[:id])
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @courses = Course.all
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to action: "index", notice: 'Se creó la evaluación exitosamente.' }
      else
        format.html {render :new}
        format.js { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    @evaluation = Evaluation.find(params[:id])
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to action: "index", notice: 'Se actualizó la evaluación exitosamente.' }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Se eliminó la evaluación exitosamente.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:course_id, :title, :evaluation_date, :minimum_note)
    end
end
