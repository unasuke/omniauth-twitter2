# frozen_string_literal: true

require "base64"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Twitter2 < OmniAuth::Strategies::OAuth2 # :nodoc:
      option :name, "twitter2"
      # https://docs.x.com/fundamentals/authentication/oauth-2-0/overview
      option :client_options, {
        site: "https://api.x.com",
        token_url: "2/oauth2/token",
        authorize_url: "https://x.com/i/oauth2/authorize"
      }
      option :pkce, true

      uid { raw_info["data"]["id"] }

      info do
        {
          name: raw_info["data"]["name"],
          email: raw_info["data"]["confirmed_email"],
          nickname: raw_info["data"]["username"],
          description: raw_info["data"]["description"],
          image: raw_info["data"]["profile_image_url"],
          urls: {
            Website: raw_info["data"]["url"],
            Twitter: "https://x.com/#{raw_info["data"]["username"]}"
          }
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get(
          "/2/users/me?" \
          "user.fields=confirmed_email,created_at,description,entities,id,location,name,pinned_tweet_id," \
          "profile_image_url,protected,public_metrics,url,username,verified,withheld",
          { headers: { "Authorization" => "Bearer #{access_token.token}" } }
        ).parsed || {}
      end

      # https://github.com/zquestz/omniauth-google-oauth2/blob/475efe41ecfcf04b63921bd723ccf6fad429d1b1/lib/omniauth/strategies/google_oauth2.rb#L105
      # https://github.com/simi/omniauth-facebook/blob/e1e572db2e9464871c98148621df1bbbe1e9f9c3/lib/omniauth/strategies/facebook.rb#L88
      # https://github.com/omniauth/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end

      def build_access_token
        options.token_params.merge!(
          headers: {
            "Authorization" => "Basic #{Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")}"
          }
        )
        super
      end
    end
  end
end
