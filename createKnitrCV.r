# Date : 05FEB2014
# Author : Alexandre Bujard

library(knitr)
library(tm)
library(wordcloud)
library(ggplot2)
library(png)
library(grid)

progLst <- list()
progLst$word <- c('R','C++','C','Java','Python','Objective-C','SQL',
                  'erlang','HTML','CSS','javascript','ada','haskell')
progLst$freq <- c(10,5,4,3,1,2,2,1,1,1,1,2,1)

pal2 <- brewer.pal(8,"Dark2")


png('mySkills.png', bg='transparent')
wordcloud(progLst$word,
	  progLst$freq,
          scale=c(8,.2),
	  min.freq=0,
          max.words=Inf,
          random.order=FALSE,
          rot.per=.15,
          colors=pal2)
dev.off()

bgField <- readPNG('mySkills.png')
g <- rasterGrob(bgField, interpolate=TRUE)


qplot(1:10, 1:10, geom="blank") +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point() 
                                 

