module Path
  class Client
    include Path::Utilities
    include Path::Authentication
    include Path::User
    include Path::Moment

    def initialize(options = {})
      @client_id     = options[:client_id]
      @client_secret = options[:client_secret]
      @code = nil

      @connection = Faraday.new(url: 'https://partner.path.com') do |f|
        f.headers['Authorization'] = "Bearer #{@access_token}" unless @access_token.nil?
        f.response :json, content_type: /\bjson$/
        f.adapter  Faraday.default_adapter
      end
    end

    def connection
      @connection
    end
  end
end
