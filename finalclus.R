getwd()
setwd("C:/Users/User/Desktop/Assignment")
getwd()

##import data set##

library(readxl)
filmx <- read_excel("Filmxx.xlsx", col_types = c("numeric", 
                                                "numeric", "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "text", 
                                                "numeric", "numeric"))
View(filmx)
str(filmx)
names(filmx)
head(filmx)
tail(filmx)
summary(filmx)
str(filmx)
nrow(filmx)
ncol(filmx)
dim(filmx)

##Load cluster package##

library(cluster)

## Get pairs ##

film1=filmx[,-9]
pairs(film1)

#plots###
plot(film1$worldwide_gross~film1$imdb_rating,xlab="Imdb_Rating",ylab="Worldwide_Income")
with(film1,text(film1$worldwide_gross~film1$imdb_rating, labels=filmx$studio))

#normalize function
normalize<-function(df)
{
  return(((df- min(df)) /(max(df)-min(df))*(1-0))+0)
}
head(filmx)

##normalization###

studio=filmx[,9]
filmx_n=filmx[,c(1,2,3,4,5,6,7,8,10,11)]
filmx_n=as.data.frame(lapply(filmx_n,normalize))
filmx_n$studio=studio


###rearrange data set##

filmx_n<-filmx_n[,c(9,1,2,3,4,5,6,7,8,10)]
View(filmx_n)

##create distance matrix##
##scale##
str(filmx_n)
scale_film=scale(filmx_n)
distance=dist(filmx_n,method = "euclidean")
print(distance,digits = 4)

##Hierarchical clstering##

hc_filmx_n=hclust(distance,method = "complete")
hc_filmx_n
plot(hc_filmx_n)
rect.hclust(hc_filmx_n,k=3,border=2:5)


##visualize distance matrix##

install.packages("factoextra")
library(factoextra)
fviz_dist(distance)



head(filmx_n)
rownames(filmx_n)=filmx_n$studio
filmx_n$studio=NULL
head(filmx_n)

## Plot the distance##

distance=dist(filmx_n,method = "euclidean")
fviz_dist(distance)

head(filmx_n)

## K-means clustering##

kc = kmeans(filmx_n[,-(2:4)],3) #k=3
kc

## Cluster plot##

clusplot(filmx_n, kc$cluster, color = TRUE, shade = TRUE, lines = 0)

## Calculate the tendency##

tendency <- get_clust_tendency(filmx_n, 40, graph = TRUE)
tendency$hopkins_stat

fviz_nbclust(filmx_n, kmeans, method = "wss")

set.seed(123)

##clustering the data##

km.fit <- kmeans(filmx_n, 3, nstart = 40)
km.fit$cluster
km.fit$size
fviz_cluster(km.fit,filmx_n)
fviz_cluster(km.fit,filmx_n,ellipse.type = "norm")







