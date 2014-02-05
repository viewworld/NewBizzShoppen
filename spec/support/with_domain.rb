def with_site(site)
  allow_any_instance_of(Rack::Domains).to receive(:domain).and_return(double(:site => site))
end
