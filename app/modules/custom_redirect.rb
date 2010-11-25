module ActionController
  module Redirecting
      def _compute_redirect_to_location(options)
        case options
        # The scheme name consist of a letter followed by any combination of
        # letters, digits, and the plus ("+"), period ("."), or hyphen ("-")
        # characters; and is terminated by a colon (":").
        when %r{^\w[\w+.-]*:.*}
          options
        when String
          request.protocol + request.host_with_port + options
        when :back
          raise RedirectBackError unless refer = request.headers["Referer"]
          if refer.include?("/bulk_action")
            refer = session[:bulk_action_back].blank? ? root_url : session[:bulk_action_back]
          end
          refer
        else
          url_for(options)
        end.gsub(/[\r\n]/, '')
      end
  end
end