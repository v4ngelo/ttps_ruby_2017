require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @course = Course.find_by_anio("2018")
  end

  test "valid student" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: @course.id)
    assert student.valid?
  end

  test "invalid student without name" do
    student = Student.new(name: "", surname: "Skywalker", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a name'
    assert_not_nil student.errors[:name]
  end

  test "invalid student without surname" do
    student = Student.new(name: "Luke", surname: "", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:surname]
  end

  test "invalid student without dni" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:dni]
  end

  test "invalid student without student number" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "luke.skywalker@mail.com", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:student_number]
  end

  test "invalid student without student email" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:email]
  end

  test "invalid student invalid student email" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "asdf", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:email]
  end

  test "invalid student not related course" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "asdf", course_id: @course.id)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:course_id]
  end
end
