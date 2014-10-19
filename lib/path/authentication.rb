module Path
  module Authentication
    def auth_url
      "https://partner.path.com/oauth2/authenticate?response_type=code&client_id=#{@client_id}"
    end

    def access_token!(code)
      data = {
        grant_type:    'authorization_code',
        client_id:     @client_id,
        client_secret: @client_secret,
        code:          code
      }

      response = @connection.post('/oauth2/access_token', params(data))

      @access_token = response.body['access_token']

      @connection = Faraday.new(url: 'https://partner.path.com') do |f|
        f.headers['Authorization'] = "Bearer #{@access_token}" unless @access_token.nil?
        f.response :json, content_type: /\bjson$/
        f.adapter  Faraday.default_adapter
      end

      @access_token
    end

    def access_token=(token)
      @access_token = token

      @connection = Faraday.new(url: 'https://partner.path.com') do |f|
        # f.headers['Authorization'] = "Bearer #{@access_token}" unless @access_token.nil?
        f.request :oauth2, @access_token
        f.request  :json
        f.response :json, content_type: /\bjson$/
        f.adapter  Faraday.default_adapter
      end
    end
  end
end
