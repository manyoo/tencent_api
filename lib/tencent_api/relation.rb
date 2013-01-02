module TencentApi
  module Relation
    class << self
      def is_friend options, &blocks
        get_remote '/v3/relation/is_friend', options, &blocks
      end

      def get_app_friends options, &blocks
        get_remote '/v3/relation/get_app_friends', options, &blocks
      end

      def get_rcmd_friends options, &blocks
        get_remote '/v3/relation/get_rcmd_friends', options, &blocks
      end
    end
  end
end
