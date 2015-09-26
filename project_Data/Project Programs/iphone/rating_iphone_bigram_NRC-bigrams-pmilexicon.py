import re
import nltk
import simplejson as json

#Collecting orginal tweets for comparision purpose:
fin=open("iphone_Tweets_2000.json","r")
data=fin.read()
fin.close()
oriTweetList=json.loads(data)

#collecting the tweets from preProcessed_tweets.json file
fin=open("iphone_Processed_tweets_bigram.json","r")
data=fin.read()
fin.close()
tweetList=json.loads(data)

#below code is for reading a NRC-bigrams-pmilexicon.txt file data into form of dictionary
'''
bigramDict={
    "so happy":[1.2365,1450,1],
    "so sad":[-1.2354,1578,0],
    .........   :   .................,
    .........   :  .................,
    ........    :  .................,
    ........     : ...........,
    }
'''
f_Lib=open('NRC-bigrams-pmilexicon.txt','r')
bigramDict=dict(map(lambda(k,m,n,o):(k,[float (m),float(n),float(o)]),[line.split('\t')for line in f_Lib]))



#*****************Rating method purpose************************
tweetRateList=[]

#this work much faster than previous
for tweet in tweetList:
    biTweet=list(nltk.bigrams(tweet.split()))
    rate=0
    for word in biTweet:
        biWord=' '.join(word).lower()
        if biWord in bigramDict:
            val=bigramDict.get(biWord)[0]
            #print biWord,":::",val
            rate=rate+val
    tweetRateList.append(rate)
'''       
for i in range(len(tweetRateList)):
    print "Rate::::Tweets"
    print "=================================================================="
    print tweetRateList[i],":::::",tweetList[i]
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
fout=open('rateIphoneNRC-bigrams-pmilexicon.txt','w')
#content=json.dumps(tweetRateList)
for rate in tweetRateList:
    fout.write(str(rate)+"\n")
fout.close()
        
            
            

