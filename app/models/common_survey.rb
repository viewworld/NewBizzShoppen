module CommonSurvey
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    public
    def is_text_type?
      question_type == SurveyQuestion::TEXT_TYPE
    end

    def is_number_type?
      question_type == SurveyQuestion::NUMBER_TYPE
    end

    def is_date_type?
      question_type == SurveyQuestion::DATE_TYPE
    end

    def is_select_type?
      question_type == SurveyQuestion::SELECT_TYPE
    end

    def is_heading_type?
      question_type == SurveyQuestion::HEADING_TYPE
    end

    def is_break_page_type?
      question_type == SurveyQuestion::BREAK_PAGE_TYPE
    end
  end
end