module Path
  module Moment
    def add_moment(type, data)
      response = @connection.post do |req|
        req.url "/1/moment/#{type}"
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end

      response.body
    end
  end
end
