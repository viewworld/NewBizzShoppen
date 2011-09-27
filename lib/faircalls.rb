class Faircalls
  def self.matches?(request)
    request.env['rack.session'][:site] == "faircalls"
  end
end

