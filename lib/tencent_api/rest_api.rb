require 'json'
require 'net/http'
require 'uri'
require 'cgi'
require 'base64'
require 'hmac-sha1'

module TencentApi
  class RestApi
    PRODUCTION = 'http://openapi.tencentyun.com'
    TESTING = 'http://119.147.19.43'
    FORMAT = 'json'

    REQUIRED = [:openid, :openkey, :pf]

    def initialize name
      @name = name
      @base_url = PRODUCTION
      @base_url = TESTING if Config.settings[:testing]
      @app_id = Config.settings[:app_id]
      @app_key = Config.settings[:app_key]
      @params = {:format => FORMAT,
                 :app_id => @app_id
                }
    end

    def sign
      uri_encoded = CGI.escape @name
      keyvalues = []
      @params.sort.each {|k, v| keyvalues.push "#{k}=#{v}"}
      params_encoded = CGI.escape(keyvalues.join '&')
      source = ['GET', uri_encoded, params_encoded].join '&'
      secret = @app_key + '&'
      hmac = HMAC::SHA1.new secret
      hmac.update source
      @params[:sig] = Base64.strict_encode64("#{hmac.digest}")
    end

    def build_url
      keyvalues = []
      @params.each {|k, v| keyvalues.push "#{k}=#{URI.escape v}" }
      [@base_url, @name, '?', keyvalues.join('&')].join
    end

    def request options
      REQUIRED.each do |f|
        if !options.member? f
          raise ArgumentError, "#{f} is required for this API."
        end
      end
      @params.merge! options
      sign
      url = URI.parse build_url
      res = Net::HTTP.get_response url
      if res.code == '200'
        js = JSON.parse res.body
        ret = js['ret']
        if ret == 0
          yield js
        else
          raise ArgumentError, js['msg']
        end
      end
    end
  end

  def self.get_remote method, options, &blocks
    api = RestApi.new method
    api.request options, &blocks
  end
end
