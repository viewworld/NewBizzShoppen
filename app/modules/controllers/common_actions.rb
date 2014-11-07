module Controllers
  module CommonActions
    private

    def common_save(subject, opts = {})
      if subject.save
        success_notice_for(subject, opts)
        redirect_to opts[:success].try(:[], :redirect) || subject
      else
        failure_alert_for(subject, opts)

        if opts[:failure].try(:[], :redirect)
          redirect_to opts[:failure].try(:[], :redirect)
        else
          render action: failure_action_for_render
        end
      end
    end

    def common_destroy(subject, opts = {})
      if subject.destroy
        success_notice_for(subject, opts)
        redirect_to opts[:success].try(:[], :redirect) || :back
      else
        failure_alert_for(subject, opts)
        redirect_to opts[:failure].try(:[], :redirect) || :back
      end
    end

    def failure_action_for_render
      action_name == 'create' ? :new : :edit
    end

    def success_notice_for(subject, opts = {})
      flash[:notice] = opts[:success].try(:[], :message) || t("common_actions.#{action_name}.success", subject: translated_class_name_for(subject))
    end

    def failure_alert_for(subject, opts = {})
      flash[:alert] = opts[:failure].try(:[], :message) || t("common_actions.#{action_name}.failure", subject: translated_class_name_for(subject))
    end

    def translated_class_name_for(subject)
      subject_class = subject.class.name
      subject_translation_key = subject_class.gsub('::','.').underscore

      t("models.#{subject_translation_key}.class_name", default: subject_class.gsub('::',' ').titleize)
    end
  end
end
