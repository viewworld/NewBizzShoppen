module ActionView
  module TemplateHandlers
    class DERB < ERB


     include ActionView::Template::Handlers::Compilable

     ActionView::Template

      def compile(template)
      template.instance_variable_set("@source", ::DERB::DerbPreprocessor.preprocess(template.source))
      super(template)
      end
    end

  end

end