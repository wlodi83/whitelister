require 'typhoeus'

class Requester

  def self.make_request(url, request_params, method)

    hydra   = Typhoeus::Hydra.new
    request = Typhoeus::Request.new(url,
                                    :timeout       => 100000,
                                    :cache_timeout => 60,
                                    :method        => method,
                                    :verbose       => true,
                                    :params        => request_params )

    request.on_complete do |response|

      if response.success?

        print "Server response: #{response.body}"
        return true

      elsif response.code == 202
    
        print "Server response with code HTTP202: #{response.body}"
        return true

      elsif response.timed_out?

        print "Server Response URL got a time out"
        return false

      elsif response.code == 0

        # Could not get an http response, something's wrong
        print "#{response.curl_error_message}"
        return false

      else

        # Received a non-successful htpp response.
        print "HTTP request failed: #{response.code.to_s}"
        return false

      end

    end

    hydra.queue(request)
    hydra.run

  end

  def self.generate_server_ips
    @ip_array = Array.new
    (0..30).each do |n|
      @ip_array.push("85.195.83.#{n}")
    end
      @ip_array.push("#{ip}")
    end
    return @ip_array
  end

end
