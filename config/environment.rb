# Load the rails application
require File.expand_path('../application', __FILE__)

Nbs::Application.configure do
  config.after_initialize do
    module SmallInspect
      def inspect
        "<#{self.class.name} - tooooo long>"
      end
    end
    [Callers::UserSessionLogsController, Warden::Proxy].each do |klazz|
      klazz.send(:include, SmallInspect)
    end
  end
end

# Initialize the rails application
Nbs::Application.initialize!
RPXNow.api_key = "9f0cf9317b63cf2a128ad27e4638b9b23af8a6aa"
