import re 
import simplejson as json


#below code is for reading a AFINN-111.txt file data into form of dictionary 
f_Lib=open('AFINN-111.txt','r')
afinn=dict(map(lambda(k,v):(k,int(v)),[line.split('\t')for line in f_Lib]))

#Collecting orginal tweets for comparision purpose:
fin=open("nokia_Tweets_2000.json","r")
data=fin.read()
fin.close()
oriTweetList=json.loads(data)

#collecting the tweets from preProcessed_tweets.json file
fin=open("nokia_Processed_tweets_unigram.json","r")
data=fin.read()
fin.close()
tweetList=json.loads(data)

#for word cloud purpose we create all words under one list


#Removing stopwords like ["is", "am", etc.., ]
from nltk.corpus import stopwords
cachedStopWords=stopwords.words("english")
def remStopwords(tweet):
        tweet_word=[word for word in tweet.split() if word not in cachedStopWords]
        twe=' '.join(tweet_word)
        return twe

newTweetList=[]
#for word cloud purpose we create all words under one list
fout=open('nokiaTweetWords.txt','w')
for tweet in tweetList:
    tweet=remStopwords(tweet)
    newTweetList.append(tweet)
    for word in tweet.split():
        fout.write(word.lower()+" ")
fout.close()
    
'''        
#*****************Rating method purpose************************
tweetRateList=[]
for tweet in newTweetList:
        rate=0
        for twe in tweet.split():
                for sk in sco_keys:
                        if sk.decode("utf-8") == twe.lower():
                                i=sco_keys.index(sk)
                                val=sco_values[i]
                                rate=rate+val
        tweetRateList.append(rate)
          
for i in range(len(tweetRateList)):
    print "Rate::::Tweets"
    print "=================================================================="
    print tweetRateList[i],":::::",oriTweetList[i]
    print
'''

        
#*****************Rating method purpose************************
tweetRateList=[]
fout=open('nokiaWords.txt','w')
for tweet in newTweetList:
        rate=0
        fout.write(tweet)
        for word in tweet.split():
                word=word.lower().encode("UTF-8")
                if word in afinn:
                        val=afinn.get(word)
                        rate=rate+val
        tweetRateList.append(rate)
fout.close()
'''          
for i in range(len(tweetRateList)):
    print "Rate::::Tweets"
    print "=================================================================="
    print tweetRateList[i],":::::",oriTweetList[i]
    print
'''    
pos=0
neg=0
neu=0
for i in range(len(tweetRateList)):
    if tweetRateList[i]>0:
        pos=pos+1
    elif tweetRateList[i]<0:
        neg=neg+1
    else:
        neu=neu+1

print "The total no of tweets are ..................",len(tweetRateList)
print "the total no of positive tweets are ........",pos
print "the total no of negitive tweets are ........",neg
print "the total no of neutral tweets are ........",neu

iphoneResults=[pos,neg,neu]
#now i sends rating list into a json file
fout=open('ratenokiaAFINN.txt','w')
#content=json.dumps(tweetRateList)
for rate in tweetRateList:
    fout.write(str(rate)+"\n")
fout.close()

'''       
iphoneResults=[pos,neg,neu]
#now i sends rating list into a csv file
fout=open('resultIphoneTweets.csv','w')
fout.write("positive :{0}\n".format(pos))
fout.close()            
 '''           

