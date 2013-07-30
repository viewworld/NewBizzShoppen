module CommonSurvey
  def is_of_type?(_type)
    question_type == SurveyQuestion.const_get("#{_type.to_s.upcase}_TYPE")
  end
end