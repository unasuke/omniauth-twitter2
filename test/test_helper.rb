# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "omniauth/twitter2"

require "minitest/autorun"

def mock_auth_sample # rubocop:disable Metrics/MethodLength
  # 2022-01-13 02:40:00 +0900
  { "provider" => "twitter2",
    "uid" => "108252390",
    "info" => {
      "name" => "うなすけ",
      "email" => nil,
      "nickname" => "yu_suke1994",
      "description" => "帰って寝たい",
      "image" => "https://pbs.twimg.com/profile_images/580019517608218624/KzEZSzUy_normal.jpg",
      "urls" => {
        "Website" => "https://t.co/NCFLB8wDkx",
        "Twitter" => "https://twitter.com/yu_suke1994"
      }
    },
    "credentials" => {
      "token" => "TOKENTOKENTOKENTOKENTOKENTOKEN",
      "expires_at" => 1_642_016_242,
      "expires" => true
    },
    "extra" => {
      "raw_info" => raw_info_sample
    } }
end

def raw_info_sample # rubocop:disable Metrics/MethodLength
  {
    "data" => {
      "profile_image_url" => "https://pbs.twimg.com/profile_images/580019517608218624/KzEZSzUy_normal.jpg",
      "url" => "https://t.co/NCFLB8wDkx",
      "public_metrics" => {
        "followers_count" => 2188,
        "following_count" => 1478,
        "tweet_count" => 162_937,
        "listed_count" => 110
      },
      "verified" => false,
      "name" => "うなすけ",
      "entities" => {
        "url" => {
          "urls" => [{
            "start" => 0,
            "end" => 23,
            "url" => "https://t.co/NCFLB8wDkx",
            "expanded_url" => "https://unasuke.com", "display_url" => "unasuke.com"
          }]
        }
      },
      "description" => "帰って寝たい",
      "created_at" => "2010-01-25T10:10:22.000Z",
      "username" => "yu_suke1994",
      "protected" => false,
      "id" => "108252390"
    }
  }
end
