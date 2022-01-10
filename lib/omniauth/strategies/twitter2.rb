# frozen_string_literal: true

require "base64"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Twitter2 < OmniAuth::Strategies::OAuth2 # :nodoc:
      option :name, "twitter2"
      option :client_options, {
        site: "https://api.twitter.com",
        token_url: "2/oauth2/token",
        authorize_url: "https://twitter.com/i/oauth2/authorize"
      }
      option :pkce, true

      uid { raw_info["data"]["id"] }

      info do
        {
          name: raw_info["data"]["name"],
          email: nil,
          nickname: raw_info["data"]["username"],
          description: raw_info["data"]["description"],
          image: raw_info["data"]["profile_image_url"],
          urls: {
            Website: raw_info["data"]["url"],
            Twitter: "https://twitter.com/#{raw_info["data"]["username"]}"
          }
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get(
          "/2/users/me?&user.fields=created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld",
          { headers: { "Authorization" => "Bearer #{access_token.token}" } }
        ).parsed || {}
      end

      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end

      def build_access_token
        options.token_params.merge!(headers: {
                                      "Authorization" => "Basic #{Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")}"
                                    })
        super
      end
    end
  end
end
