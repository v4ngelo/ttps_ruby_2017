require 'test_helper'

class EvaluationsReporterTest < ActiveSupport::TestCase

  def setup
    @reporter = EvaluationsReporter.new
  end

  test 'should be empty' do
    report = @reporter.report(nil)
    assert_not report.nil?
    assert report.course_evaluations_results.empty?
    assert report.course_results.empty?
  end

  test 'should be empty - Course ID doesnt exist' do
    report = @reporter.report({"course_id" => 200})
    assert_not report.nil?
    assert report.course_evaluations_results.empty?
    assert report.course_results.empty?
  end

  test 'should match fixture data' do
    course_id = Course.find_by_anio("2018").id
    report = @reporter.report({"course_id" => course_id})
    assert_not report.nil?
    assert report.course_results.size == 3
    assert report.course_evaluations.size == 3
    assert report.course_evaluations_results.size == 3
  end

end