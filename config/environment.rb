# Load the rails application
require File.expand_path('../application', __FILE__)

Nbs::Application.configure do
  config.after_initialize do
    module SmallInspect
      def inspect
        "<#{self.class.name} - tooooo long>"
      end
    end
    [Callers::UserSessionLogsController, Warden::Proxy, ActionDispatch::RemoteIp::RemoteIpGetter].each do |klazz|
      klazz.send(:include, SmallInspect)
    end
  end
end

# Initialize the rails application
Nbs::Application.initialize!
