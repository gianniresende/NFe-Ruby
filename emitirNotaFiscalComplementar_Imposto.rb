require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/complementar/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'

request.body = "{\n    \"nfe_referenciada\": \"00000000000000000000000000000000000000000000\",\n    \"operacao\": 1,\n    \"natureza_operacao\": \"Natureza da operação\",\n    \"ambiente\": 2,\n    \"cliente\": {\n        \"cpf\": \"000.000.000-00\",\n        \"nome_completo\": \"Nome completo\",\n        \"endereco\": \"Av. Brg. Faria Lima\",\n        \"complemento\": \"Escritorio\",\n        \"numero\": 1000,\n        \"bairro\": \"Itaim Bibi\",\n        \"cidade\": \"São Paulo\",\n        \"uf\": \"SP\",\n        \"cep\": \"00000-000\",\n        \"telefone\": \"(00) 0000-0000\",\n        \"email\": \"nome@email.com\"\n    },\n    \"produtos\": [\n        {\n            \"nome\": \"Nome do produto\",\n            \"codigo\": \"nome-do-produto\",\n            \"ncm\": \"6109.10.00\",\n            \"cest\": \"28.038.00\",\n            \"quantidade\": 1,\n            \"unidade\": \"UN\",\n            \"peso\": \"0.500\",\n            \"origem\": 0,\n            \"subtotal\": \"29.90\",\n            \"total\": \"29.90\",\n            \"tributos_federais\": \"10.00\",\n            \"tributos_estaduais\": \"10.00\",\n            \"impostos\": {\n                \"icms\": {\n                    \"codigo_cfop\": \"6.102\",\n                    \"situacao_tributaria\": \"102\"\n                },\n                \"ipi\": {\n                    \"situacao_tributaria\": \"99\",\n                    \"codigo_enquadramento\": \"999\",\n                    \"aliquota\": \"0.00\"\n                },\n                \"pis\": {\n                    \"situacao_tributaria\": \"99\",\n                    \"aliquota\": \"0.00\"\n                },\n                \"cofins\": {\n                    \"situacao_tributaria\": \"99\",\n                    \"aliquota\": \"0.00\"\n                }\n            }\n        }\n    ]\n}"

response = http.request(request)
puts response.read_body