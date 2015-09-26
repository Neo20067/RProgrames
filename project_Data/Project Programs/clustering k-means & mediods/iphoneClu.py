import simplejson as json

fin=open("iphone_processed_tweets_unigram.json","r")
dataEmo=fin.read()
fin.close()
x=json.loads(dataEmo)

y=["iphone","itunes","gameinsight","iphonegame","collected","coins","gold","apple","states","united","apps","mac","music","food","harvested",
   "app","ios","ipad"]

for i in y:
    print i
    print'========================================================================================'
    count=0
    for j in x:
        if i in j.lower().encode("UTF-8"):
            print j
            print
            count=count+1
            if count==20:
                break
            
    print "===================================================================================="


fout=open("iphoneClu.txt","w")

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
