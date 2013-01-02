require "tencent_api/version"

module TencentApi
  METHODS = {}

  class << self
    def get_api name
      if METHODS.member? name
        METHODS[name].new
      end
    end
  end
end
