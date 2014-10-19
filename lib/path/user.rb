module Path
  module User
    def user(id = 'self')
      @connection.get("/1/user/#{id}").body
    end

    def friends(id = 'self')
      @connection.get("/1/user/#{id}/friends").body
    end
  end
end
