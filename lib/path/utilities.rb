module Path
  module Utilities
    def params(hsh)
      hsh.collect { |i| "#{i.first}=#{i.last}" }.join('&')
    end
  end
end
