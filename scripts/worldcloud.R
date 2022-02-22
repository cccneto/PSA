
keywords<-M$ID
write.table(c(keywords), "keywords.txt", row.names = FALSE)

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

keyword_text <- readLines("keywords.txt")
docs <- Corpus(VectorSource(keyword_text))

docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
jpeg("wordcloud.jpg",width=7,height=7,units="in",res=150)

worcloud <-wordcloud(words = d$word, freq = d$freq, min.freq = 1,
                    max.words=200, random.order=FALSE, rot.per=0.35,
                    colors=brewer.pal(8, "Dark2"))
plot(wordcloud(words = d$word, freq = d$freq, min.freq = 1,
               max.words=200, random.order=FALSE, rot.per=0.35,
               colors=brewer.pal(8, "Dark2")))
dev.off()