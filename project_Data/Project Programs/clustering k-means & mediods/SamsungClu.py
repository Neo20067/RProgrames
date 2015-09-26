import simplejson as json

fin=open("samsung_Processed_tweets.json","r")
dataEmo=fin.read()
fin.close()
x=json.loads(dataEmo)

y=["apple","sales","smartphone","samsunggalaxy","bids", "ebay", "samrtphones"," technology","phone", "new","edge","android","mobile","note","galaxys6","iphone","galaxy","samsung"]

for i in y:
    print i
    print'========================================================================================'
    count=0
    for j in x:
        if i in j.lower():
            print j
            print
            count=count+1
            if count==20:
                break
            
    print "===================================================================================="


fout=open("samsungClu.txt","w")

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
