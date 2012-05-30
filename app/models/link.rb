class Link < ActiveRecord::Base
  validates_presence_of :url
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix

  before_validation :add_http, :on => :create
  
  after_create :fetch_link_details
  
  def add_http
    unless url =~ /https?:\/\//
      self.url = "http://#{url}"
    end
  end
  
  def fetch_link_details
    return unless title.blank?
    job = FetchLinkDetailsJob.new(id)
    Delayed::Job.enqueue(job)
  end
  
end
