require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "valid student" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: 1)
    assert student.valid?
  end

  test "invalid student without name" do
    student = Student.new(name: "", surname: "Skywalker", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: 1)
    refute student.valid?, 'The student result is invalid without a name'
    assert_not_nil student.errors[:name]
    assert_not_nil student.errors[:surname], 'no validation error for student surname present'
    assert_not_nil student.errors[:dni], 'no validation error for student dni present'
    assert_not_nil student.errors[:student_number], 'no validation error for student number present'
    assert_not_nil student.errors[:email], 'no validation error for student email present'
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student without surname" do
    student = Student.new(name: "Luke", surname: "", dni: "1111", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname]
    assert_not_nil student.errors[:dni], 'no validation error for student dni present'
    assert_not_nil student.errors[:student_number], 'no validation error for student number present'
    assert_not_nil student.errors[:email], 'no validation error for student email present'
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student without dni" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "", student_number: "1111/1",
                          email: "luke.skywalker@mail.com", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname], 'no validation error for student surname'
    assert_not_nil student.errors[:dni]
    assert_not_nil student.errors[:student_number], 'no validation error for student number present'
    assert_not_nil student.errors[:email], 'no validation error for student email present'
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student without student number" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "luke.skywalker@mail.com", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname], 'no validation error for student surname'
    assert_not_nil student.errors[:dni], 'no validation error for student dni'
    assert_not_nil student.errors[:student_number]
    assert_not_nil student.errors[:email], 'no validation error for student email present'
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student without student email" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname], 'no validation error for student surname'
    assert_not_nil student.errors[:dni], 'no validation error for student dni'
    assert_not_nil student.errors[:student_number], 'no validation error for student number'
    assert_not_nil student.errors[:email]
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student invalid student email" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "asdf", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname], 'no validation error for student surname'
    assert_not_nil student.errors[:dni], 'no validation error for student dni'
    assert_not_nil student.errors[:student_number], 'no validation error for student number'
    assert_not_nil student.errors[:email]
    assert_not_nil student.errors[:course_id], 'no validation error for evaluation course'
  end

  test "invalid student not related course" do
    student = Student.new(name: "Luke", surname: "Skywalker", dni: "1111", student_number: "",
                          email: "asdf", course_id: 1)
    refute student.valid?, 'The student result is invalid without a surname'
    assert_not_nil student.errors[:name], 'no validation error for student name present'
    assert_not_nil student.errors[:surname], 'no validation error for student surname'
    assert_not_nil student.errors[:dni], 'no validation error for student dni'
    assert_not_nil student.errors[:student_number], 'no validation error for student number'
    assert_not_nil student.errors[:email], 'no validation error for student email'
    assert_not_nil student.errors[:course_id]
  end
end
