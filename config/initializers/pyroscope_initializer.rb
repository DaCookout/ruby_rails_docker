require "pyroscope"

Pyroscope.configure do |config|
  config.app_name = "abalone.ruby.server" # replace this with some name for your application
  config.server_address = "http://pyroscope-server:4040" # replace this with your Pyroscope server address

  tags = {
    "git_tag": ENV["GIT_TAG"] || "none",
    "git_author": ENV["GIT_AUTHOR"] || "none"
  }

  config.tags = tags
end
