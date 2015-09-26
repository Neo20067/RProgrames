import simplejson as json

fin=open("moto_Processed_tweets.json","r")
dataEmo=fin.read()
fin.close()
x=json.loads(dataEmo)

y=["monitor","wifi","pet","scout","display","baby","audio","mbp13","lte","xt1039","android","inch","motorola","mobile","phone",
   "moto","black","free","sim"]

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


fout=open("motoClu.txt","w")

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
