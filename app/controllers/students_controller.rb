class StudentsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    if params.has_key?(:course)
      @students = Student.where(course_id: params[:course][:course_id])
    else
      @students = Student.all
    end
  end

  # GET /students/new
  def new
    @courses = Course.all
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @courses = Course.all
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @courses = Course.all
    respond_to do |format|
      if @student.save
        format.html { redirect_to action: "index", notice: 'Se creó el estudiante exitosamente.' }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to action: "index", notice: 'Se actualizó el estudiante exitosamente.' }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Se eliminó el estudiante exitosamente.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:course_id, :name, :surname, :dni, :student_number, :email)
    end
end
