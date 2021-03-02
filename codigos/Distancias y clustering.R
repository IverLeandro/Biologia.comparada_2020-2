getwd()
setwd("D:/IVER/Comparada/Lab")

## required packages
library(cluster);library(ape);library(vegan)

## read data
cars <- read.delim("C:/Users/UIS/Documents/ApeR/Data/cars.tab", stringsAsFactors=FALSE)
cars

## check 
head(cars)

## alter data
carsUse <- cars[,-c(1,2)]
head(carsUse)

## mean
?apply 
medians = apply(carsUse,2,median) #aplica la función en 1=filas, 2=columnas
medians

##organize
sort(carsUse$Cylinders)
?sort 
length(carsUse$Cylinders)
?lenght 
sort(carsUse$Cylinders)[c(19,20)]
median(carsUse$Cylinders) 

## standarize
mads <- apply(carsUse,2,mad) # 2=columns
mad(carsUse$Cylinders)

## carros en uso
carsUse2 <- scale(carsUse,center=medians,scale=mads) #estandarizar desde la media
carsUse2[c(36,38),6]
carsUse[c(36,38),6]

## draw stats
hist(carsUse2)
names(carsUse2)
str(carsUse2)
?scale

## distances
cars.dist1 <- dist(carsUse2)
head(cars.dist1)
?dist

## euclidian distance
cars.dist2 <- dist(carsUse2, method="euc")
cars
head(cars.dist1)

## cluster
?hclust
t2<-(hclust(cars.dist2, method = "average", members=NULL))
t1<-(hclust(cars.dist1, method = "average", members=NULL))

##plot distances
plot(hclust(cars.dist1, method = "average", members=NULL))
plot(hclust(cars.dist2, method = "average", members=NULL))

#cophenetic matrix
c1<-cophenetic(t1)
c2<-cophenetic(t2)

## correlation
cor(cars.dist1,c1)
cor(cars.dist2,c2)
