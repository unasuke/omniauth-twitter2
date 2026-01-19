# OmniAuth::Twitter2
[![test](https://github.com/unasuke/omniauth-twitter2/actions/workflows/main.yml/badge.svg)](https://github.com/unasuke/omniauth-twitter2/actions/workflows/main.yml)
[![GitHub license](https://img.shields.io/github/license/unasuke/omniauth-twitter2)](https://github.com/unasuke/omniauth-twitter2/blob/main/LICENSE.txt)
[![Gem Version](https://badge.fury.io/rb/omniauth-twitter2.svg)](https://rubygems.org/gems/omniauth-twitter2)

This gem provides a OmniAuth strategy for authenticating with Twitter OAuth2.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-twitter2'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install omniauth-twitter2
```

## Usage

### Rails

```ruby
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"], 
    callback_path: '/auth/twitter2/callback', 
    scope: "tweet.read users.read"  # Default scope
end
```

### Available Scopes

The following OAuth 2.0 scopes are available for X (Twitter) API v2:

- `tweet.read` - All the Tweets you can view, including Tweets from protected accounts.
- `tweet.write` - Tweet and Retweet for you.
- `tweet.moderate.write` - Hide and unhide replies to your Tweets.
- `users.email` - Email from an authenticated user.
- `users.read` - Any account you can view, including protected accounts.
- `follows.read` - People who follow you and people who you follow.
- `follows.write` - Follow and unfollow people for you.
- `offline.access` - Stay connected to your account until you revoke access.
- `space.read` - All the Spaces you can view.
- `mute.read` - Accounts you've muted.
- `mute.write` - Mute and unmute accounts for you.
- `like.read` - Tweets you've liked and likes you can view.
- `like.write` - Like and un-like Tweets for you.
- `list.read` - Lists, list members, and list followers of lists you've created or are a member of, including private lists.
- `list.write` - Create and manage Lists for you.
- `block.read` - Accounts you've blocked.
- `block.write` - Block and unblock accounts for you.
- `bookmark.read` - Get Bookmarked Tweets from an authenticated user.
- `bookmark.write` - Bookmark and remove Bookmarks from Tweets.
- `media.write` - Upload media.

Default scope is `"tweet.read users.read"` if not specified.

You can customize the scope like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"],
    callback_path: '/auth/twitter2/callback',
    scope: "tweet.read tweet.write users.read offline.access"
end
```

### Auth Hash

```ruby
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
        "Twitter" => "https://x.com/yu_suke1994"
      }
    },
    "credentials" => {
      "token" => "TOKENTOKENTOKENTOKENTOKENTOKEN",
      "expires_at" => 1642016242,
      "expires" => true
    },
    "extra" => {
      "raw_info" => {
        "data" => {
          "profile_image_url" => "https://pbs.twimg.com/profile_images/580019517608218624/KzEZSzUy_normal.jpg",
          "url" => "https://t.co/NCFLB8wDkx",
          "public_metrics" => {
            "followers_count" => 2188,
            "following_count" => 1478,
            "tweet_count" => 162937,
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
    }
  }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## References

* Twitter official resources
  * [xdevplatform/Twitter-API-v2-sample-code: Sample code for the Twitter API v2 endpoints](https://github.com/xdevplatform/Twitter-API-v2-sample-code)
  * [OAuth 2.0 - X](https://docs.x.com/fundamentals/authentication/oauth-2-0/overview)
* [arunagw/omniauth-twitter: OmniAuth strategy for Twitter](https://github.com/arunagw/omniauth-twitter)
* [omniauth/omniauth-oauth2: An abstract OAuth2 strategy for OmniAuth.](https://github.com/omniauth/omniauth-oauth2)
* [nov/twitter_oauth2: Twitter OAuth 2.0 Client Library in Ruby](https://github.com/nov/twitter_oauth2)

## Sample App
* <https://twitter-login-app.onrender.com/>
  * <https://github.com/unasuke/twitter-login-app>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/unasuke/omniauth-twitter2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/unasuke/omniauth-twitter2/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache License 2.0](https://opensource.org/licenses/Apache-2.0).

## Code of Conduct

Everyone interacting in the OmniAuth::Twitter2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/unasuke/omniauth-twitter2/blob/main/CODE_OF_CONDUCT.md).
