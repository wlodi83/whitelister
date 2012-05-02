require './requester.rb'

URL = {
  :hasoffers => "http://sponsorpaynetwork.api.hasoffers.com/Api/json"
}

Requester.generate_server_ips.each do |ip|
  Requester.make_request(
    URL[:hasoffers],
    {
      "Format"             => "json",
      "Service"            => "HasOffers",
      "Version"            => "2",
      "NetworkId"          => "*****************",
      "NetworkToken"       => "*****************",
      "Target"             => "OfferWhitelist",
      "Method"             => "create",
      "data[offer_id]"     => "12790",
      "data[type]"         => "postback",
      "data[content_type]" => "ip address",
      "data[content]"      => "#{ip}"
    },
    :get 
  ) 
end
