class Erhvervsanalyse
  def self.matches?(request)
    request.env['rack.session'][:site] == "erhvervsanalyse"
  end
end

