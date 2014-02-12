def with_site(site)
  $site = site # so sorry for global variable
  allow_any_instance_of(Rack::Domains).to receive(:site).and_return { $site }
end
