# "Trumpd"
## Inspiration
Most recently with Trump's uncorroborated claim that president Obama personally ordered to wiretap the trump towers during the 2016 election cycle, a lot of media attention has been brought to if we can believe what the president says. Unlike most other public figures President Trump is very vocal on Twitter and has received a lot of media attention for sending outrageous tweets at seemingly minuscule things for the purpose of inflating his ego. In a time when social media influences the way in which the people receive information about the world it is imperative to be able to determine facts from fakes news. 
## What it does
Trumpd aims to resolve this issue by first analyzing the president’s Twitter feed and for each tweet giving a list of credible news sources that talk about the validity of his claims. We have incorporated both text and image sentiment analysis from the Microsoft Cognitive Services API, as well as the Bing search API to query for news articles directly related to a tweet. After an election cycle that was heavily influenced by fake news we hope that our app will allow everyone to gain access to more reliable news sources. 
## How we built it
We scraped thousands of Trump images and automatically cropped the images to get only his face. We also utilized the Twitter Firehouse API to scrape thousands of Trump's real tweets. With the Microsoft's Face API we were able to detect emotions in each of the scraped images. Furthermore, using Microsoft's Text Analytics API we were able to detect the emotions related to each of Trump's tweets. Lastly, when a certain tweet is chosen by a user, we were able to perform a validity check of Trump's tweets by using Microsoft Web Search API to search for news articles related to his tweets. 
## Challenges we ran into
There were intricacies in integrating the various components of the app together, such as building up the framework, utilizing APIs, and scraping thousands of images.
## Accomplishments that we're proud of
Working through the challenges of being new to iOS development and being able to make a presentable prototype. 
## What we learned
We learned how to use the various APIs in a beneficial way for our product to work in a successful prototype. We also learned how to correctly map textual sentiment values to corresponding picture sentiment values, which was one of the core engineering challenges for our project. 
## What's next for Trumpd
Being able to perform validity checks on other politicians.
