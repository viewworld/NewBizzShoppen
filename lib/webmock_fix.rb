module WebMock
  def self.net_connect_allowed?(uri = nil)
    if uri.is_a?(String)
      uri = WebMock::Util::URI.normalize_uri(uri)
    end
    Config.instance.allow_net_connect ||
      (Config.instance.allow_localhost && WebMock::Util::URI.is_uri_localhost?(uri)) ||
      Config.instance.allow && (
        (Config.instance.allow.kind_of?(Regexp) && uri.to_s =~ Config.instance.allow) ||
        (Config.instance.allow.respond_to?(:include?) &&
         (Config.instance.allow.include?(uri.host) || Config.instance.allow.include?("#{uri.host}:#{uri.port}"))))
  end
end