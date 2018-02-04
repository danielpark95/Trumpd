from twython import Twython # pip install twython
import time # standard lib

''' Go to https://apps.twitter.com/ to register your app to get your api keys '''
CONSUMER_KEY = "5Pk7FUiRYLTO38AiebUq3nGs2"
CONSUMER_SECRET = "zfN5y6Sx42xlZVZ45M4QLGuYbWid2M3w0Z05YdZeNRXYNICqbx"
ACCESS_KEY = "375482690-5ukRqBEbBkehbbuQyaQmL3pXpwa5k46WwoyrP9Sk"
ACCESS_SECRET = "LhFO8KgRE3iIfwBWsAoV6axqYreZGqsbdomNYUu7YKfZS"

twitter = Twython(CONSUMER_KEY,CONSUMER_SECRET,ACCESS_KEY,ACCESS_SECRET)
lis = [467020906049835008] ## this is the latest starting tweet id
for i in range(0, 16): ## iterate through all tweets
## tweet extract method with the last list item as the max_id
    user_timeline = twitter.get_user_timeline(screen_name="realrealdonaldtrump",
    count=200, include_retweets=False, max_id=lis[-1])
    time.sleep(300) ## 5 minute rest between api calls

    for tweet in user_timeline:
        print (tweet['text']) ## print the tweet
        lis.append(tweet['id']) ## append tweet id's