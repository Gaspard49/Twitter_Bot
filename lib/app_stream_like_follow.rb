require 'twitter'
require 'dotenv'


def text_to_like
  puts "which hashtag would you like to follow and like  in streaming?"
  print ">"
  user_input = gets.chomp
  return user_input
end


def login_twitter
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]	
	end
	return client
end

def login_twitter_Streaming
	client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]	
	end
	return client
end

Dotenv.load('.env')




def stream

clientStream = login_twitter_Streaming
clientREST = login_twitter
 clientStream.filter(track: "##{text_to_like}") do |tweet|
  puts tweet.text
  clientREST.favorite(tweet)
  clientREST.follow(tweet.user.id)
end
end

stream