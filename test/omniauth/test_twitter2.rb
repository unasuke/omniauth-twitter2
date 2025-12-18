# frozen_string_literal: true

require "test_helper"
require "omniauth"

class TestOmniAuthTwitter2 < Minitest::Test
  def setup
    OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:twitter2] = OmniAuth::AuthHash.new(mock_auth_sample)
  end

  def teardown
    OmniAuth.config.test_mode = false
  end

  def strategy(options = {})
    OmniAuth::Strategies::Twitter2.new("CLIENT_ID", "CLIENT_SECRET", options)
  end

  def test_that_it_has_a_version_number
    assert ::OmniAuth::Twitter2::VERSION
  end

  def test_it_has_strategy_name_twitter2
    assert_equal "twitter2", strategy.options.name
  end

  def test_it_has_correct_site
    assert_equal "https://api.x.com", strategy.options.client_options.site
  end

  def test_it_has_correct_token_url
    assert_equal "2/oauth2/token", strategy.options.client_options.token_url
  end

  def test_it_has_correct_authorize_url
    assert_equal "https://x.com/i/oauth2/authorize", strategy.options.client_options.authorize_url
  end

  def test_it_has_correct_info_hash
    subject = strategy
    subject.stub(:raw_info, raw_info_sample) do
      assert_equal "うなすけ", subject.info[:name]
      assert_equal "user@example.com", subject.info[:email]
      assert_equal "yu_suke1994", subject.info[:nickname]
      assert_equal "帰って寝たい", subject.info[:description]
    end
  end

  def test_email_is_nil_when_not_provided
    subject = strategy
    raw_info_without_email = raw_info_sample.dup
    raw_info_without_email["data"] = raw_info_without_email["data"].except("confirmed_email")
    subject.stub(:raw_info, raw_info_without_email) do
      assert_nil subject.info[:email]
    end
  end

  def test_it_has_uid
    subject = strategy
    subject.stub(:raw_info, raw_info_sample) do
      assert_equal "108252390", subject.uid
    end
  end
end
