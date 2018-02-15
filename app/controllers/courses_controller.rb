class CoursesController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to action: "index", notice: 'Se actualizó la cursada exitosamente.' }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to action: "index", notice: 'Se creó la cursada exitosamente.' }
        format.json { render :index, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if Course.destroy(params[:id])
      flash['success'] = "Cursada eliminada correctamente."
      redirect_to action: "index"
    else
      flash['error'] = "La cursada no pudo ser eliminada. Existen Alumnos y Evaluaciones que dependen de ella!"
      redirect_to courses_path
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private
  def course_params
    params.require(:course).permit(:id, :anio)
  end

end
