import re
import HTMLParser
import simplejson as json

#*****************STEP-1*****************************************************************
#Escaping HTML charecters in a tweets
def escHTML(tweet):
    html_parser=HTMLParser.HTMLParser()
    tweet=tweet=html_parser.unescape(tweet)
    return tweet

#*****************STEP-2*****************************************************************
#Removing heyperlinks in the tweets
def remHyper(tweet):
    tweet=' '.join(re.sub("(^0-9A-Za-z \t)|(\w+:\/\/\S+)"," ",tweet).split())# For removing hyper links
    return tweet

#open file for reading Data
fin=open("motoRawTweets.json","r")
data=fin.read()
fin.close()
x=json.loads(data)
print len(x)

#here the 'x' list have repeated tweets so we have to remove the tweets
y=[]
for i in x:
    i=escHTML(i)
    i=remHyper(i)
    if i not in y:
        y.append(i)
print "============================"
print len(y)


y=list(set(y))#but here tweets are arrenged in ascending order
print len(y)

#But here tweets are greaterthan 2000 so we have to minimize to 2000
iphoneTweets=[]
for i in range(2000):
    iphoneTweets.append(y[i])
print len(iphoneTweets)

for i in range(len(iphoneTweets)):
    print i,":::::",iphoneTweets[i]
    print 

fout=open('moto_Tweets_2000.json','w')
content=json.dumps(iphoneTweets)
fout.write(content)
fout.close()

