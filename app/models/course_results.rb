class CourseResults
  include ActiveModel::Model

  attr_accessor :evaluation_name, :approved, :disapproved, :absent, :approved_percentage

  def initialize(evaluation_name, approved, disapproved, absent)
    @evaluation_name = evaluation_name
    @approved = approved
    @disapproved = disapproved
    @absent = absent
    if(approved == 0)
      @approved_percentage = 0
    else
      @approved_percentage = (approved * 100) / (approved + disapproved)
    end
  end

end