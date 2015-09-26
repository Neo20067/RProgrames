library(rjson)
library(RJSONIO)
library(tm)
iphone=fromJSON("iphone_Processed_tweets_unigram.json")
mycor=Corpus(VectorSource(iphone))
mycor=tm_map(mycor,tolower)
mycor=tm_map(mycor,removePunctuation)
mycor=tm_map(mycor,removeNumbers)
mycor=tm_map(mycor,removeWords,stopwords("english"))

mycor1=mycor
mycor=tm_map(mycor,PlainTextDocument)

mytdm=TermDocumentMatrix(mycor)
m=as.matrix(mytdm)

wordFreq=sort(rowSums(m),decreasing=TRUE)
library(wordcloud)
set.seed(375)

grayLevels=gray((wordFreq+10)/(max(wordFreq)+10))
wordcloud(words=names(wordFreq), freq=wordFreq, min.freq=30, random.order=FALSE, colors=grayLevels)


