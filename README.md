# Sentry::Title

Plugin that parses HTML-titles and sends them to the channel. It blocks some domains that has to be explicitly allowed so not to interfere with plugins that handles those speficic sites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sentry-title'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sentry-title

## Usage

```ruby
require 'cinch'
require 'cinch/plugins/sentry/titles'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "Raknet"
    c.server = "irc.oftc.net"
    c.channels = ["#cinchdev"]
    c.plugins.plugins = [Cinch::Plugins::Sentry::Titles]
    c.plugins.options = {
      Cinch::Plugins::Sentry::Titles => {
        "blacklist" => [
          "facebook.com"
        ],
        "whitelist" => [
          "reddit.com",
          "www.reddit.com"
        ]
      }
    }
  end
end

bot.start
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sentry-title/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
