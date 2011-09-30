class Fairdeals
  def self.matches?(request)
    request.env['rack.session'][:site] == "fairdeals"
  end
end

