require 'twitter'
require 'dotenv'


def text_to_like
  puts "which hashtag would you like to follow and like  in streaming?"
  print ">"
  user_input = gets.chomp
  return user_input
end

Dotenv.load('.env')


def login_twitter_Streaming
	client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]	
	end
	return client
end



def stream

clientStream = login_twitter_Streaming
clientStream.filter(track: "##{text_to_like}") do |tweet|
  puts object.text if object.is_a?(Twitter::Tweet)
end
end

stream