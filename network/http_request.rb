#!/usr/bin/env ruby

require "net/http"

word = "small"
uri = URI("https://od-api.oxforddictionaries.com/api/v2/entries/en/" + word)
req = Net::HTTP::Get.new(uri)
req["api_id"] = "23a89c87"
req["api_key"] = "bdc75325d9d9ea4aa006d39fc83d72f2"
req["Accept"] = "application/json"
resp = Net::HTTP.start(uri.hostname, uri.port) { |http|
  http.request(req)
}
puts resp.body
