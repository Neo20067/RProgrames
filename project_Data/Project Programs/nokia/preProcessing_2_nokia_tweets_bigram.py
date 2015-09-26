
import re
import string
import itertools
import simplejson as json

#*****************STEP-1*****************************************************************
#Removing heyperlinks in the tweets
def remHyper(tweet):
    tweet=' '.join(re.sub("(^0-9A-Za-z \t)|(\w+:\/\/\S+)"," ",tweet).split())# For removing hyper links
    return tweet
#************STEP-2************************************************************************
#Changing emoticons into words
#open file for reading Data from emoticon_words_Json.json file
fin=open("emoticon_words_Json.json","r")
dataEmo=fin.read()
fin.close()
emoDict=json.loads(dataEmo)
emo_keys=emoDict.keys()
emo_words=emoDict.values()
#method for change emoticon tweet in text tweet
def emoticons(tweet):
        for ek in emo_keys:
                if ek in tweet:
                        j=emo_keys.index(ek)
                        tweet=tweet.replace(ek,emo_words[j])
        return tweet
#*************STEP-3*************************************************************************
#Changing Acronyms into words
#open file for reading Data from acronymJson.json file
fin=open("acronym_words_Json.json","r")
dataAcro=fin.read()
fin.close()
acroDict=json.loads(dataAcro)
#method for change Acronyms tweet in text tweet
def acronyms(tweet):
    tweetList=tweet.split()
    newTwe=[]
    for word in tweetList:
        if word.lower() in acroDict:
            word=acroDict.get(word.lower())
        newTwe.append(word)
        #newTwe=filter(None,newTwe)
    return ' '.join(newTwe)

#***************STEP-4***********************************************************************
#Filtering a tweet i.e converting happppppyyyy-------->happy
def remRepeatedChar(tweet):
        tweet=''.join(''.join(s)[:2] for _, s in itertools.groupby(tweet))
        return tweet

#****************STEP-5***********************************************************************
#converting #tag into Words And @user into null i.e #iphone.@siva----------->iphone,"  ".
def remUserName(tweet):
    #tweet=' '.join(re.sub("([@][A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)"," ",tweet).split())
    tweet=' '.join(re.sub("([@][A-Za-z0-9]+)|(^0-9A-Za-z \t)|(\w+:\/\/\S+)"," ",tweet).split())#for removing only @user
    return tweet

#**************STEP-6*************************************************************************
#for replacing non-ascii chars with single space bars
def reNonAscii(tweet):
        tweet=tweets=' '.join(re.sub(r'[^\x00-\x7F]+',' ',tweet).split())
        return tweet

#*********************************************************************************************
fin=open("nokia_Tweets_2000.json","r")
data=fin.read()
fin.close()
tweetList=json.loads(data)
preProcessed_tweets=[]

def main():
    for tweet in tweetList:
        #print "Before:::",tweet
        tweet=remHyper(tweet)
        tweet=emoticons(tweet)
        tweet=acronyms(tweet)
        tweet=remRepeatedChar(tweet)
        tweet=remUserName(tweet)
        tweet=reNonAscii(tweet)
        tweet=acronyms(tweet)
        #print "After:::",tweet
        #print '========================================================='
        #print
        preProcessed_tweets.append(tweet)
    fout=open('nokia_Processed_tweets_bigram.json','w')
    content=json.dumps(preProcessed_tweets)
    fout.write(content)
    fout.close()
        


if __name__ == "__main__": main()
        
                
    

