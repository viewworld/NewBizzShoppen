class SurveyChainMailType < ChainMailType
  EXECUTION_CONDITIONS = [
      ['survey not open', SURVEY_NOT_OPENED],
      ['survey incomplete', SURVEY_INCOMPLETE],
      ['survey complete', SURVEY_COMPLETE]
  ]
end