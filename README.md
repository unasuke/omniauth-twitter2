# OmniAuth::Twitter2

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
  provider :twitter2, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"], callback_path: '/auth/twitter2/callback', scope: "tweet.read users.read"
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
        "Twitter" => "https://twitter.com/yu_suke1994"
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
  * [twitterdev/Twitter-API-v2-sample-code: Sample code for the Twitter API v2 endpoints](https://github.com/twitterdev/Twitter-API-v2-sample-code)
  * [OAuth 2.0 Making requests on behalf of users | Docs | Twitter Developer Platform](https://developer.twitter.com/en/docs/authentication/oauth-2-0/user-access-token)
* [arunagw/omniauth-twitter: OmniAuth strategy for Twitter](https://github.com/arunagw/omniauth-twitter)
* [omniauth/omniauth-oauth2: An abstract OAuth2 strategy for OmniAuth.](https://github.com/omniauth/omniauth-oauth2)
* [nov/twitter_oauth2: Twitter OAuth 2.0 Client Library in Ruby](https://github.com/nov/twitter_oauth2)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/unasuke/omniauth-twitter2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/unasuke/omniauth-twitter2/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache License 2.0](https://opensource.org/licenses/Apache-2.0).

## Code of Conduct

Everyone interacting in the OmniAuth::Twitter2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/unasuke/omniauth-twitter2/blob/main/CODE_OF_CONDUCT.md).
