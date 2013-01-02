module TencentApi
  module User
    class << self
      def get_info options, &blocks
        get_remote '/v3/user/get_info', options, &blocks
      end

      def get_multi_info options, &blocks
        get_remote '/v3/user/get_multi_info', options, &blocks
      end

      def total_vip_info options, &blocks
        get_remote '/v3/user/total_vip_info', options, &blocks
      end

      def is_vip options, &blocks
        get_remote '/v3/user/is_vip', options, &blocks
      end

      def friends_vip_info options, &blocks
        get_remote '/v3/user/friends_vip_info', options, &blocks
      end

      def is_setup options, &blocks
        get_remote '/v3/user/is_setup', options, &blocks
      end

      def is_login options, &blocks
        get_remote '/v3/user/is_login', options, &blocks
      end

      def is_area_login options, &blocks
        get_remote '/v3/user/is_area_login', options, &blocks
      end
    end
  end
end
