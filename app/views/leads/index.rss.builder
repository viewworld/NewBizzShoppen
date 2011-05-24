xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Fairleads"
    xml.description "The latest leads"
    xml.link leads_url

    for lead in @leads
      xml.item do
        xml.title lead.header
        xml.description lead.description
        xml.pubDate lead.created_at.to_s(:rfc822)
        xml.link lead_url(lead)
      end
    end
  end
end