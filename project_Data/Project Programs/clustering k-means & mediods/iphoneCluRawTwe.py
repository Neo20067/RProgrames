import simplejson as json
import re

fin=open("iphoneRawTweets.json","r")
dataEmo=fin.read()
fin.close()
x=json.loads(dataEmo)

y=["iphone","itunes","gameinsight","iphonegame","collected","coins","gold","apple","states","united","apps","mac","music","food","harvested",
   "app","ios","ipad"]
#for replacing non-ascii chars with single space bars
def reNonAscii(tweet):
        tweet=' '.join(re.sub(r'[^\x00-\x7F]+',' ',tweet).split())
        return tweet
for i in y:
    print i
    print'========================================================================================'
    count=0
    for j in x:
        j=reNonAscii(j)
        if i in j.lower().encode("UTF-8"):
            print j
            print
            count=count+1
            if count==20:
                break
            
    print "===================================================================================="


fout=open("20iphoneClu.txt","w")

for i in y:
    fout.write(i)
    fout.write('========================================================================================')
    count=0
    for j in x:
        if i in j.lower():
            fout.write(j+"\n")
            
            count=count+1
            
            if count==20:
                break
            
    fout.write("====================================================================================")
