require 'twitter'
require 'dotenv'

def text_to_tweet
  puts "What do you want to tweet todays?"
  print ">"
  user_input = gets.chomp
  return user_input
end



def login_twitter
Dotenv.load('.env')
# quelques lignes qui appellent les clés d'API de ton fichier .env
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

# ligne qui permet de tweeter sur ton compte
return client
end

def perform
  login_twitter.update(text_to_tweet)
end
perform
