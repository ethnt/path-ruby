# path-ruby

A Ruby wrapper for the [Path API](https://path.com/developers/docs#intro).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'path'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install path

## Usage

```ruby
# First create a client with your client_id and client_secret.
client = Path::Client.new(client_id: 'foobar', client_secret: 'barfoo')

# Redirect your user to the auth URL and it'll come back with an auth code.
client.auth_url # => https://partner.path.com/oauth2/authenticat?response_type=code&client_id=foobar

# Exchange your code for an access token and you're all set.
client.access_token!('code')

# Now, make requests.
client.user # => #<Hash>
client.add_moment('thought', { thought: 'Hello!', private: true })
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/path/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
