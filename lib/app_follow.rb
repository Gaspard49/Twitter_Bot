require 'twitter'
require 'dotenv'


def text_to_like
  puts "which hashtag would you like to follow"
  print ">"
  user_input = gets.chomp
  return user_input
end

def times_to_like
  puts "How many would you like to follow"
  print ">"
  user_input = gets.chomp.to_i
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
end



def follow_tweet
  login_twitter.search("##{text_to_like}", result_type: "recent").take(times_to_like).collect do |tweet|
  login_twitter.follow(tweet.user.screen_name)
end
end

def perform
  follow_tweet
end
perform

