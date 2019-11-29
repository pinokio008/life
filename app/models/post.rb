require 'uri'
require 'net/http'
require 'openssl'

class Post < ApplicationRecord
  enum pageid: { hesitation: 0 }
  def self.useRFQ(uri, host, key)
    url = URI(uri)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = host
    request["x-rapidapi-key"] = key

    return http.request(request)
  end
end
