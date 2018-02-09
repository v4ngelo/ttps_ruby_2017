require 'test_helper'

class EvaluationResultTest < ActiveSupport::TestCase
  test "valid evaluation note" do
    evaluation_result = EvaluationResult.new(note: 8, student_id: 1, evaluation_id: 1)
    assert evaluation_result.valid?
  end

  test "invalid without note" do
    evaluation_result = EvaluationResult.new(note: "", student_id: 1, evaluation_id: 1)
    refute evaluation_result.valid?, 'The evaluation result is invalid without a note'
    assert_not_nil evaluation_result.errors[:student], 'no validation error for student present'
    assert_not_nil evaluation_result.errors[:evaluation], 'no validation error for evaluation present'
    assert_not_nil evaluation_result.errors[:note]
  end

  test "invalid evaluation note not a number" do
    evaluation_result = EvaluationResult.new(note: "a", student_id: 1, evaluation_id: 1)
    refute evaluation_result.valid?, 'The evaluation result is invalid without a valid note'
    assert_not_nil evaluation_result.errors[:student], 'no validation error for student present'
    assert_not_nil evaluation_result.errors[:evaluation], 'no validation error for evaluation present'
    assert_not_nil evaluation_result.errors[:note]
  end

  test "invalid evaluation note related student" do
    evaluation_result = EvaluationResult.new(note: 0, evaluation_id: 1)
    refute evaluation_result.valid?, 'The evaluation result is invalid without a related student'
    assert_not_nil evaluation_result.errors[:note], 'no validation error for student present'
    assert_not_nil evaluation_result.errors[:evaluation], 'no validation error for evaluation present'
    assert_not_nil evaluation_result.errors[:student]
  end

  test "invalid evaluation note related evaluation" do
    evaluation_result = EvaluationResult.new(note: 5, student_id: 1)
    refute evaluation_result.valid?, 'The evaluation result is invalid without a related evaluation'
    assert_not_nil evaluation_result.errors[:note], 'no validation error for student present'
    assert_not_nil evaluation_result.errors[:student], 'no validation error for evaluation present'
    assert_not_nil evaluation_result.errors[:evaluation]
  end
end
