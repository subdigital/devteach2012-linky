require 'digest'
require 'net/http'

class FetchUserAvatarJob
  @queue = :avatar
  
  def self.perform(user_id)
    user = User.find(user_id)
    digest = Digest::MD5.hexdigest(user.email)
    url = "http://gravatar.com/avatar.php?gravatar_id=#{digest}"
    filename = "#{Rails.root}/public/uploads/#{user_id}.jpg"
    
    File.open(filename, "wb") do |f|
      f << open(url).read
    end
  end
  
end