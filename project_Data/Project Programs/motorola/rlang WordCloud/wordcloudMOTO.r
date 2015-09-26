getwd()
setwd("F:/python programs/new project programs/motorola/rlang")
library(rjson)
library(RJSONIO)
library(tm)
iphone=fromJSON("moto_Processed_tweets_unigram.json")
mycor=Corpus(VectorSource(iphone))
mycor=tm_map(mycor,tolower)
mycor=tm_map(mycor,removePunctuation)
mycor=tm_map(mycor,removeNumbers)
stwd=c(stopwords("english"),"motorola")
mycor=tm_map(mycor,removeWords,stwd)

mycor1=mycor
mycor=tm_map(mycor,PlainTextDocument)

mytdm=TermDocumentMatrix(mycor)
m=as.matrix(mytdm)
word_freqs=sort(rowSums(m),decreasing=TRUE)
dm = data.frame(word=names(word_freqs), freq=word_freqs)

library(wordcloud)
wordcloud(dm$word, dm$freq, min.freq=10, random.order=FALSE, colors=brewer.pal(6, "Dark2"))


