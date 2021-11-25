local https = require "ssl.https"
local cjson = require "cjson"
local ltn12 = require "ltn12"

local chunks = {}
https.TIMEOUT= 10 

local ok, statusCode, headers, statusText = https.request {
  method = "GET",
  url = "https://piyasa.paratic.com/API/api.php?c=USD/TRL&l=1&p=1&hisse=undefined&zaman=&symbol=undefined&interval=undefined&limit=undefined&a=getGraphData",
  sink = ltn12.sink.table(chunks),
  protocol= "tlsv1_2",
  content_type="application/json",
}
local response = table.concat(chunks)
local respTable = cjson.decode(response)
print("USD/TRY:",respTable[1].o)