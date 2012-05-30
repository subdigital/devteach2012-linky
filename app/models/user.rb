class User < ActiveRecord::Base
  validates_presence_of :email

  after_save :fetch_avatar
  
  def fetch_avatar
    Resque.enqueue(FetchUserAvatarJob, id)
  end
end
