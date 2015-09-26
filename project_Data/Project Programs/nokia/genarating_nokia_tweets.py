import time
import twitter
import simplejson as json
api=twitter.Api(consumer_key='fTvflTetYEeYQSSUguUurraWr',
                            consumer_secret='0dodeFU9k3oa6AEUxP3hZocc3t5P4WKNmMSGekKa2Yl88xIdux',
                            access_token_key='2963581733-VrturotZSS5BcESODwIR9GjtFFuKRBsytEF9Uwo',
                            access_token_secret='LxjyWgwlN19qQLXNnd2gkAjaPxNkmyFrNgHCXIbwXcQZV')
word='#Nokia'

def tweetId():
    first_id=api.GetSearch(term=word,lang='en',count=1)
    for f in first_id:
        twe_id=f.GetId()
    return twe_id

idNum=tweetId()
y=[]
n=100
for i in range(100):
    y.extend(api.GetSearch(term=word,lang='en',count=n,max_id=idNum))
    idNum=y[len(y)-1].GetId()
print len(y)

list_twe=[]
for i in range(len(y)):
    list_twe.append(y[i].GetText())
    #print i,"::",list_twe[i]
    #print
    
fout=open('nokiaRawTweets.json','w')
content=json.dumps(list_twe)
fout.write(content)
fout.close()
    










