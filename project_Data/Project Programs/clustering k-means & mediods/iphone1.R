setwd("k:/programs/clustering")
library(rjson)
library(RJSONIO)
library(tm)
iTweets=fromJSON("iphone_Processed_tweets_unigram.json")
mycor=Corpus(VectorSource(iTweets))
mycor=tm_map(mycor,tolower)
mycor=tm_map(mycor, removePunctuation)
#mycor=tm_map(mycor, removeNumbers)
reURL=function(x) gsub("http[[:alnum:]]*","",x)
mycor=tm_map(mycor, reURL)
stwd=c(stopwords('english'),"via")
mycor=tm_map(mycor, removeWords,stwd)


mycor1=mycor
mycor=tm_map(mycor,PlainTextDocument)
#Creating termdocument matrix

itdm=TermDocumentMatrix(mycor)
findFreqTerms(itdm, lowfreq=30)
termF=rowSums(as.matrix(itdm))
termF=subset(termF, termF>=30)
barplot(termF, las=2, ylab="number of Words",col=c("red"), main="Bar plot for iphone words")

#which words are associated with iphone
findAssocs(itdm, c("iphone","apple","itunes","gameinsight"), 0.25)

#clustering a words
itdm1=removeSparseTerms(itdm,sparse=0.94)
m2=as.matrix(itdm1)
distMatrix=dist(scale(m2))
fit=hclust(distMatrix, method="ward.D")
plot(fit,main="Cluster dendrogram for iphone words")
rect.hclust(fit,k=6)
(groups=cutree(fit,k=6))

#clustering tweets
#clustering tweets with k-means algorithm
#transpose the matrix to cluster documents(tweets)
m3=t(m2)
distMatrix=dist(scale(m3))
fit=hclust(distMatrix, method="ward.D")
plot(fit)

#set a fixed random seed
set.seed(100)
#k-means clustering of tweets
library(fpc)
library(cluster)
kdoc=m3
rownames(kdoc)=1:2000
#k-means clustering of tweets
k=4
  
kmeansResult=kmeans(kdoc,k)
d1=daisy(kdoc)
d2=d1^2
clusplot(kdoc,kmeansResult$cl, color=TRUE,  labels=4, lines=0, main="k-means clusplot for iphone tweets")
sk=silhouette(kmeansResult$cl, d2)
plot(sk,main="k-mean silhouette plot for iphone tweets")

#cluster centers
round(kmeansResult$centers, digits=3)
#to make it easy to find what clusters are about, we then check the top three words in every cluster.
for(i in 1:k){
  cat(paste("cluster",i,": ", sep=""))
  s=sort(kmeansResult$centers[i,], decreasing=T)
  cat(names(s)[1:4],"\n")
  #print the tweets of every cluster
  #print(rdmTweets[pamResult$clustering==i])
  
}

#clustering tweets with the k-medoids algorithm
library(fpc)
#partitioning around mediods with estimation of numbers of clusters
pamResult=pamk(m3,metric="manhattan")
#number of clusters identified
(k=pamResult$nc)
pamResult=pamResult$pamobject
#print cluter medoids
for(i in 1:k){
  cat(paste("cluster", i, ": "))
  cat(colnames(pamResult$medoids)[which(pamResult$medoids[i,]==1)],"\n")
  #print tweets in cluster i
  #print  (rdmTweets[pamResult$clustering==i])
}

#plot clustering result
#layout(matrix(c(1,3),3,1))#set to two graphs per page
clusplot(pamResult,pamResult$cl, color=TRUE, labels=4, lines=0, main="k-medoids clusplot for iphone tweets")
plot(pamResult, color=F, labels=4, lines=0, cex=.8, col.clus=1,col.p=pamResult$clustering,main="k-medoids silhouette plots for iphone Tweets")
layout(matrix(1))# change back to one graph per page
