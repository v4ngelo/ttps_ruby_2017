require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

  date = Date.new(2018,9,9)
  old_date = Date.new(2016,9,9)

  test "valid evaluation" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: date, minimum_note: 1, course_id: 1)
    assert evaluation.valid?
  end

  test "invalid - old evaluation date" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: old_date, minimum_note: 1, course_id: 1)
    refute evaluation.valid?, 'The evaluation has an old date'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date]
    assert_not_nil evaluation.errors[:minimum_note], 'no validation error for minimum_note present'
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid - absent evaluation date" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: "", minimum_note: 1, course_id: 1)
    refute evaluation.valid?, 'The evaluation has an empty date'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date]
    assert_not_nil evaluation.errors[:minimum_note], 'no validation error for minimum_note present'
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid - absent evaluation date not a date" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: "asdf", minimum_note: 1, course_id: 1)
    refute evaluation.valid?, 'The evaluation has an invalid date'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date]
    assert_not_nil evaluation.errors[:minimum_note], 'no validation error for minimum_note present'
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid - asbsent title" do
    evaluation = Evaluation.new(title: "", evaluation_date: date, minimum_note: 1, course_id: 1)
    refute evaluation.valid?, 'The evaluation is invalid without a title'
    assert_not_nil evaluation.errors[:title]
    assert_not_nil evaluation.errors[:evaluation_date], 'no validation error for evaluation date'
    assert_not_nil evaluation.errors[:minimum_note], 'no validation error for minimum_note present'
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid evaluation - minimum note absent" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: date, minimum_note: "", course_id: 1)
    refute evaluation.valid?, 'The evaluation is invalid without valid minimum note'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date], 'no validation error for evaluation date'
    assert_not_nil evaluation.errors[:minimum_note]
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid evaluation - minimum note not a number" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: date, minimum_note: "a", course_id: 1)
    refute evaluation.valid?, 'The evaluation result is invalid without a valid minimum note'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date], 'no validation error for evaluation date'
    assert_not_nil evaluation.errors[:minimum_note]
    assert_not_nil evaluation.errors[:course_id], 'no validation error for course present'
  end

  test "invalid evaluation note related course" do
    evaluation = Evaluation.new(title: "Evaluation title", evaluation_date: date, minimum_note: 1, course_id: "")
    refute evaluation.valid?, 'The evaluation result is invalid without a related course'
    assert_not_nil evaluation.errors[:title], 'no validation error for title present'
    assert_not_nil evaluation.errors[:evaluation_date], 'no validation error for evaluation date'
    assert_not_nil evaluation.errors[:minimum_note], 'no validation error for minimum_note present'
    assert_not_nil evaluation.errors[:course_id]
  end
end
