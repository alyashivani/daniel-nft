module BxBlockPosts
  class PostCreateApi
    require 'uri'
    require 'net/http'
    require 'openssl'

    def initialize(owner_address, token_id)
      @owner_address = owner_address
      @token_id = token_id
    end

    def validate_nft
      url = URI("https://api.opensea.io/api/v1/assets?owner=#{@owner_address}&token_ids=#{@token_id}&include_orders=true")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["Accept"] = 'application/json'
      request["X-API-KEY"] = '1bfb7e45af9b43ab87e729d64508b8d5'
      response = http.request(request)
      parsed_json = ActiveSupport::JSON.decode(response.body)
      return {asset: parsed_json["assets"][0]} if response.code == "200" && parsed_json["assets"] != []
    end
  end
end
