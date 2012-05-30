require 'open-uri'

class FetchLinkDetailsJob < Struct.new(:link_id)
  def perform
    Rails.logger.info "Fetching link details for link #{link_id}"
    link = Link.find(link_id)
    
    doc = Nokogiri::HTML(open(link.url))
    link.title = doc.css("title").first.content
    
    # <meta name='description' content='my site is awesome...'>
    # <META NAME=... >
    meta_desc = doc.css("meta[name='description']")
    if meta_desc.any?
      link.description = meta_desc.first["content"]
    end
    
    link.save!
  end
end