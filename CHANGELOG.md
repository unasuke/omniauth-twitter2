## [Unreleased]

### Added
- Added `AVAILABLE_SCOPES` constant with all supported X (Twitter) OAuth 2.0 scopes
- Added `DEFAULT_SCOPE` constant set to "tweet.read users.read"
- Added default `authorize_params` with scope configuration
- Added `authorize_params` method to handle scope validation and defaults
- Added comprehensive documentation for available scopes in README

### Changed
- Scope parameter is now explicitly handled with defaults and validation

## [1.0.0] - 2025-08-03

- Update api endpoints from `twitter.com` to `x.com` ([#7](https://github.com/unasuke/omniauth-twitter2/pull/7))

## [0.1.0] - 2022-01-13

- Initial release
