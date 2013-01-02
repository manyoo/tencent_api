module TencentApi
  module Config
    class << self
      attr_accessor :settings
      def init_tencent_api options
        @settings = options
      end
    end
  end
end