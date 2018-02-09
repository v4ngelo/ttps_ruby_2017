require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "valid course" do
    course = Course.new(anio: "2018")
    assert course.valid?
  end

  test "invalid without year" do
    course = Course.new(anio: "")
    refute course.valid?, 'The Course is invalid without a year'
  end

end
