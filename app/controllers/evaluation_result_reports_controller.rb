class EvaluationResultReportsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?

  def initialize
    super # this calls ActionController::Base initialize
    init_this
  end

  def index
    @courses = Course.all
    if params.has_key?(:course)
      @report = @reporter.report(course_id: params[:course][:course_id])
    else
      @reporter.report(nil)
    end
  end

  private

  def init_this
    @reporter = EvaluationsReporter.new
  end
end
