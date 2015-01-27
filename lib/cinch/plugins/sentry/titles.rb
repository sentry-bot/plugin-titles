require 'cinch'
require 'nokogiri'
require 'uri'
require 'cgi'

module Cinch
  module Plugins
    module Sentry
      class Title
        include Cinch::Plugin

        # Listen to all events in the channel
        listen_to :channel

        def initialize(*)
          super
          @bot = bot
        end

        def listen(m)
          # Extract urls
          urls = extract_urls(m.message)

          # Blacklist of urls that are not allowed
          blacklist = [
            "redd.it",
            "www.redd.it",
            "reddit.com",
            "www.reddit.com",
            "www.dailymotion.com",
            "dailymotion.com",
            "dai.ly",
            "www.dai.ly",
            "vimeo.com",
            "www.vimeo.com",
            "www.youtube.com",
            "youtube.com",
            "youtu.be",
            "www.youtu.be"
            "github.com",
            "www.github.com"]

          # Build blacklist
          blacklist.concat(config["blacklist"]) if config.key? "blacklist"

          # List of extensions that are ignored
          extensions = [
            ".gif",
            ".jpg",
            ".jpeg",
            ".png",
            ".bmp",
            ".js",
            ".rb",
            ".css",
            ".pdf",
            ".gifv"]

          # Build extension list
          extensions.concat(config["extensions"]) if config.key? "extensions"

          # List of blacklist overrides
          whitelist = []

          # Build list of overrides
          whitelist.concat(config["whitelist"]) if config.key? "whitelist"

          # Handle all urls individually
          urls.each do |url|
            # Parse the url
            uri = URI.parse(url.to_url)

            # Skip all blacklisted hosts that are not explicitly allowed
            next if blacklist.include?(uri.host) and not whitelist.include?(uri.host)

            # Skip all links that leads to files
            next if extensions.include?(File.extname(uri.path))

            # Load the page
            page = Nokogiri::HTML(open(url.to_url, :allow_redirections => :all))

            # Send the title to the channel
            m.reply("[%s] %s" % [
              Format(:green, "LINK")
              Format(:bold, page.css("title").text.strip)
              ])
          end
        end
      end
    end
  end
end