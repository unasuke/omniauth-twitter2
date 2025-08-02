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
    refute_nil ::OmniAuth::Twitter2::VERSION
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
      assert_nil subject.info[:email]
      assert_equal "yu_suke1994", subject.info[:nickname]
      assert_equal "帰って寝たい", subject.info[:description]
    end
  end

  def test_it_has_uid
    subject = strategy
    subject.stub(:raw_info, raw_info_sample) do
      assert_equal "108252390", subject.uid
    end
  end

  def test_it_has_available_scopes_constant
    assert_equal 20, OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES.length
    assert_includes OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES, "tweet.read"
    assert_includes OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES, "users.read"
    assert_includes OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES, "users.email"
    assert_includes OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES, "media.write"
    assert_includes OmniAuth::Strategies::Twitter2::AVAILABLE_SCOPES, "offline.access"
  end

  def test_it_has_default_scope
    assert_equal "tweet.read users.read", OmniAuth::Strategies::Twitter2::DEFAULT_SCOPE
  end

  def test_it_has_default_authorize_params
    subject = strategy
    assert_equal "tweet.read users.read", subject.options.authorize_params[:scope]
  end

  def test_authorize_params_includes_scope
    subject = strategy
    params = subject.authorize_params
    assert_equal "tweet.read users.read", params[:scope]
  end

  def test_authorize_params_with_custom_scope
    subject = strategy(authorize_params: { scope: "tweet.read tweet.write users.read" })
    params = subject.authorize_params
    assert_equal "tweet.read tweet.write users.read", params[:scope]
  end

  def test_authorize_params_validates_scopes
    # This test ensures that invalid scopes are handled gracefully
    subject = strategy(authorize_params: { scope: "invalid.scope tweet.read" })
    params = subject.authorize_params
    # The method should still return params even with invalid scopes (just warn)
    assert_equal "invalid.scope tweet.read", params[:scope]
  end
end
