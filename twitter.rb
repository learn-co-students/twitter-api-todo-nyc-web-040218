require 'twitter'
require 'yaml'
require "pry"
class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
      # binding.pry
    end
    # binding.pry
  end


  def most_recent_friend
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
    client.friends.first # .attrs[:users][0][:name]
    # binding.pry
  end


  def find_user_for(username)
    client.user(username)

    #find the twitter gem method that returns the correct user, given a username
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    data = client.followers(username).attrs[:users].take(10)

  end

  def homepage_timeline
    client.home_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
  end

end

#Bonus:

# uncomment out the following and read the bonus instructions.
# remember to comment out the WebMock line of your spec_helper, as the instructions dictate.

tweet_client = TwitterApi.new
puts tweet_client.most_recent_friend
puts tweet_client.find_user_for("google")
puts tweet_client.find_followers_for("google")
puts tweet_client.homepage_timeline







#:headers=>
 #    {:accept=>"application/json",
 #     :user_agent=>"Twitter Ruby Gem 5.11.0"},
 #   :request=>{:open_timeout=>10, :timeout=>30},
 #   :proxy=>nil},
 # @consumer_key="ScrE8rpleXIq7sGoTb2o3Ye74",
 # @consumer_secret=
 #  "UlXecAm1Xq7Ih3BSBAm9Jx6bxRTPS3cgozOuZu2RpeE8wn2X7u",
