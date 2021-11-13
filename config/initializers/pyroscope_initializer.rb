require "pyroscope"

Pyroscope.configure do |config|
  config.app_name = "abalone.ruby.server" # replace this with some name for your application
  config.server_address = ENV["IS_DOCKER"] ? "http://pyroscope-server:4040" : "http://localhost:4040"

  tags = {
    "git_tag": ENV["GIT_TAG"] || "none",
    "git_author": ENV["GIT_AUTHOR"] || "none"
  }

  config.tags = tags
end
