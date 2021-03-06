require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/consulta/?chave=00000000000000000000000000000000000000000000")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'

response = http.request(request)
puts response.read_body