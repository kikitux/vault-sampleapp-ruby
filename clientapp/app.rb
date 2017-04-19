require "vault"

client = Vault::Client.new(
    address: "http://192.168.56.11:8200",
    token: "9875e715-193e-7f1e-7487-f4fdd16be7e9",
)

mysecret = client.get("/v1/secret/hello")

puts mysecret[:data][:value]
